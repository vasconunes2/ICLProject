  open Ast
  module H = Hashtbl

  let debug = ref false

  let dummy_loc = Lexing.dummy_pos, Lexing.dummy_pos

  exception Error of Ast.location * string

  (* use the following function to signal typing errors, e.g.
        error ~loc "unbound variable %s" id
  *)
  let error ?(loc=dummy_loc) f =
    Format.kasprintf (fun s -> raise (Error (loc, s)))
      ("@[" ^^ f ^^ "@]")

  type fn_env = (string, fn) H.t

  let fn_env : fn_env = H.create 16

  let dummy_var = { v_name = "dummy"; v_ofs = -1 }



  type var_env = (string, var) H.t

  (*5 This function checks for duplicate arguments in a function definition*)
let check_args args : unit =
    let rec aux ids = function
      | [] -> ()
      | x :: xs ->
          if List.exists (fun y -> y.id = x.id) ids then
            error ~loc:x.loc "duplicate argument %s" x.id
          else
            aux (x :: ids) xs
    in
    aux [] args

    
  let add_builtin_fn name arity =
    let params = List.init arity (fun i -> { v_name = "arg" ^ string_of_int i; v_ofs = -1 }) in
    let fn = { fn_name = name; fn_params = params } in
    H.add fn_env name fn

  let () =
    add_builtin_fn "len" 1;
    add_builtin_fn "list" 1;
    add_builtin_fn "range" 1
      
  let rec expr (ctx: var_env) (e: Ast.expr) =
    match e with
    | Ecst c -> TEcst c
    | Eident x -> begin
        try
          let v = H.find ctx x.id in
          TEvar v
        with Not_found ->
          error ~loc:x.loc "Unbound variable %s" x.id
      end
    | Ebinop (op, e1, e2) ->
        TEbinop (op, expr ctx e1, expr ctx e2)
    | Eunop (op, e) ->
        TEunop (op, expr ctx e)
    | Ecall (f, args) -> begin
        match f.id, args with
        | "list", [Ecall ({ id = "range"; _ }, [re])] ->
            TErange (expr ctx re)

        | "list", [Ecall ({ id = "range"; _ }, args)] ->
            error ~loc:f.loc "Function %s can only be called with list(range(e)), but got %d arguments to range"
              f.id (List.length args)

        | "list", _ ->
            error ~loc:f.loc "Function %s can only be called with list(range(e))" f.id

        | "range", _ ->
            error ~loc:f.loc "Function %s can only be called with list(range(e))" f.id

        | _ -> begin
            try
              let fn = H.find fn_env f.id in
              let len_args = List.length args in
              let len_params = List.length fn.fn_params in
              if len_args <> len_params then
                error ~loc:f.loc "Function %s expects %d arguments, but got %d"
                  f.id len_params len_args;
              TEcall (fn, List.map (expr ctx) args)
            with Not_found ->
              error ~loc:f.loc "Function %s not found" f.id
          end 
        end
    | Elist e ->
        TElist (List.map (expr ctx) e)
    | Eget (e1, e2) ->
        let t1 = expr ctx e1 in
        let t2 = expr ctx e2 in
        begin match t1 with
        | TElist _ | TEvar _ | TEget _ -> TEget (t1, t2)
        | TErange _ -> TEget (t1, t2)
        | TEcall (fn, _) when fn.fn_name = "list" -> TEget (t1, t2)
        | _ -> error ~loc:(dummy_loc) "Get operation can only be applied to lists"
        end


  let rec stmt (ctx: var_env) (s: Ast.stmt) : Ast.tstmt =
    match s with
    | Sif (e, s1, s2) ->
        TSif (expr ctx e, stmt ctx s1, stmt ctx s2)
    | Sreturn e ->
        TSreturn (expr ctx e)
    | Sassign (x, e) ->
        let v = H.find ctx x.id (* this should never fail *) in
        TSassign (v, expr ctx e)
    | Sprint e ->
        TSprint (expr ctx e)
    | Sblock sl ->
        TSblock (List.map (stmt ctx) sl)
    | Sfor (x, e, s) -> 
        let v = H.find ctx x.id in
        TSfor(v,expr ctx e,stmt ctx s)
    | Seval e ->
        TSeval (expr ctx e)
    | Sset (e1, e2, e3) ->
        let l = expr ctx e1 in
        let i = expr ctx e2 in
        let v = expr ctx e3 in
        begin match l with
        | TElist _ | TEvar _ | TEget _ | TErange _ -> TSset (l, i, v)
        | TEcall (fn, _) when fn.fn_name = "list" -> TSset (l, i, v)
        | _ -> error ~loc:dummy_loc "Set operation can only be applied to lists"
        end

  (*6. The scope of variables is statically defined.*)
let alloc_var ctx x =
  match H.find_opt ctx x.id with
  | Some v when v.v_ofs <> -1 -> (*is Local varieble*)
      error ~loc:x.loc "Variable %s is already defined" x.id
  | _ ->
      H.replace ctx x.id { v_name = x.id; v_ofs = -1 }

  let rec alloc_vars ctx (s: Ast.stmt) =
    match s with
    | Sif (_, s1, s2) ->
        alloc_vars ctx s1; alloc_vars ctx s2
    | Sassign (x, _) ->
        alloc_var ctx x
    | Sblock sl ->
        List.iter (alloc_vars ctx) sl
    | Sfor (x, _, s) ->
        alloc_var ctx x; alloc_vars ctx s
    | Sprint _ | Sreturn _ | Seval _ | Sset (_, _, _) -> ()

  let def (f, args, body) =
    let mk_var x = { v_name = x.id; v_ofs = -1 } in
    let targs = List.map mk_var args in
    check_args args;(* check for duplicate arguments *)
    let fn = { fn_name = f.id; fn_params = targs } in
    if f.id = "len" || f.id = "list" || f.id = "range" then (* 2.2 check if the function is a built-in function *)
      error ~loc:f.loc "Function %s is a built-in function" f.id
    else if H.mem fn_env f.id then  (*2.1 check if the function is already declared *)
      error ~loc:f.loc "Function %s already declared" f.id
    else (* add the function to the global environment *)
      H.add fn_env f.id fn;(*1.2 Recursive function*)
    let ctx = H.create 32 in (* empty context *)
    List.iter (fun v -> H.add ctx v.v_name v) targs;
    alloc_vars ctx body;
    let tbody = stmt ctx body in
    (fn, tbody)

  let file ?debug:(b=true) (p: Ast.file) : Ast.tfile =
    debug := b;
    let defs, s = p in
    (* typing all the declared functions *)
    let tdefs = List.map def defs in
    let ctx = H.create 32 in (* empty context *)
    alloc_vars ctx s;
    let ts = stmt ctx s in
    let fn_main = { fn_name = "main"; fn_params = [] } in
    let tmain = (fn_main, ts) in
    tmain :: tdefs
