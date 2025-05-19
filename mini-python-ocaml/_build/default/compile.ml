
open Format
open X86_64
open Ast

let debug = ref false

let preamble = "
P_print_int:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    %rdi, %rsi
      movq    $S_message_int, %rdi
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret
P_print:
      # arg to print is in %rdi;
      # for now, let us assume it is always an integer
      # and let us ignore the tag
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      call    P_print_int
      movq    %rbp, %rsp
      popq    %rbp
      ret
P_alloc_int:
      pushq   %rbp
      movq    %rsp, %rbp
      pushq   %rdi        # the integer n to allocate is stored in %rdi
                          # and now we push it into the stack;
      andq    $-16, %rsp  # stack alignment;
      movq    $16, %rdi   # how many bytes you want to allocate;
      call    malloc      # the new allocated address is in %rax,
                          # which is a 16 bytes = 2 * 8 = 2 * 64 bits
                          # segment;
      movq    $2, (%rax)  # put the tag of an integer block
                          # in the address pointed by %rax;
      movq    -8(%rbp), %rdi # get back the value of n, which is now on
                             # the stack, at address %rbp - 8 bytes;
      movq    %rdi, 8(%rax)  # put the value of n at address
                             # %rax + 8 bytes;
      #### Now, we have the following, contiguous block allocated:
      ####
      ####        +---------+---------+
      ####        |    2    |    n    |
      ####        +---------+---------+
      ####        | 8 bytes | 8 bytes |
      ####        +---------+---------+
      ####
      movq    %rbp, %rsp
      popq    %rbp
      ret                 # the result is in %rax
P_print_newline:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    $S_newline, %rdi
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret
"

let data_inline = "
S_message_int:
  .string    \"%d\"
S_message_None:
  .string    \"None\"
S_newline:
  .string    \"\\n\"
C_None:
  .quad       0
C_False:
  .quad       1
  .quad       0
C_True:
  .quad       1
  .quad       1
"

let leave =
  movq (reg rbp) (reg rsp) ++ popq rbp ++ ret

let enter =
  pushq (reg rbp) ++ movq (reg rsp) (reg rbp)

let new_label =
  let c = ref 0 in
  fun () -> incr c; "L_" ^ (string_of_int !c)

type env_alloc = {
  mutable nb_local: int;
  mutable nb_total: int;
}

let empty_alloc_env () = {
  nb_local = 0;
  nb_total = 0;
}

let alloc_var env v =
  if v.v_ofs = -1 then begin
    env.nb_local <- env.nb_local + 1;
    let ofs = -8 * env.nb_local in
    v.v_ofs <- ofs;
    env.nb_total <- env.nb_total + 1
  end

let rec alloc_vars env (s: Ast.tstmt) =
  match s with
  | TSif (_, s1, s2) -> alloc_vars env s1; alloc_vars env s2
  | TSreturn _ -> ()
  | TSassign (x, _) -> alloc_var env x
  | TSprint _ -> ()
  | TSblock sl ->
      List.iter (alloc_vars env) sl
  | TSfor (x, _, s) ->
      alloc_var env x; alloc_vars env s
  | TSeval _ -> ()
  | TSset (_, _, _) -> ()

let rec compile_expr (e: Ast.texpr) =
  match e with
  | TEcst (Cint n) ->
      movq (imm64 n) (reg rdi) ++ call "P_alloc_int" ++
      movq (reg rax) (reg rdi)
  | TEcst Cnone ->
      movq (ilab "C_None") (reg rdi)
  | TEcst _ -> assert false (* TODO *)
  | TEvar x ->
      let ofs = x.v_ofs in
      movq (ind ~ofs rbp) (reg rdi)
  | TEbinop (_, _, _) -> assert false (* TODO *)
  | TEunop (_, _) -> assert false (* TODO *)
  | TEcall (fn, el) ->
      let push_arg e =
        compile_expr e ++
        pushq (reg rdi) in
      List.fold_left (fun a e -> push_arg e ++ a) nop el ++
      call ("F_" ^ fn.fn_name) ++
      addq (imm (8 * List.length el)) (reg rsp) ++
      movq (reg rax) (reg rdi)
  | TElist _ -> assert false (* TODO *)
  | TErange _ -> assert false (* TODO *)
  | TEget (_, _) -> assert false (* TODO *)

let rec compile_stmt exit_lbl (s: Ast.tstmt) =
  match s with
  | TSif (_, _, _) -> assert false (* TODO *)
  | TSreturn e ->
      compile_expr e ++
      movq (reg rdi) (reg rax) ++
      jmp exit_lbl
  | TSassign (x, e) ->
      (* x.v_ofs <> -1 *)
      let ofs = x.v_ofs in
      compile_expr e ++ (* value of e in %rdi *)
      movq (reg rdi) (ind ~ofs rbp)
  | TSprint e ->
      compile_expr e ++ call "P_print" ++ call "P_print_newline"
  | TSblock sl ->
      List.fold_left (fun c s -> c ++ compile_stmt exit_lbl s) nop sl
  | TSfor (_, _, _) -> assert false (* TODO *)
  | TSeval e ->
      compile_expr e
  | TSset (_, _, _) -> assert false (* TODO *)

let compile_tdef (fn, tstmt) =
  (* allocate all params in fn.fn_params with
     a positive ofset wrt %rbp *)
  let ofs = ref 8 in
  let alloc_param v =
    ofs := !ofs + 8;
    v.v_ofs <- !ofs in
  List.iter alloc_param fn.fn_params;
  let env = empty_alloc_env () in
  alloc_vars env tstmt;
  let exit_lbl = new_label () in
  let body = compile_stmt exit_lbl tstmt in
  let lbl = label ("F_" ^ fn.fn_name) in
  let locals =
    if env.nb_total = 0 then nop
    else andq (imm (-8 * env.nb_total)) (reg rsp) in
  (* put everything together *)
  lbl ++ (* introduce label *)
  enter ++ (* classic entering function *)
  locals ++ (* move rsp according to the number of local vars *)
  body ++ (* body of the function *)
  label exit_lbl ++ (* introduce exit label *)
  leave (* leave function *)

let compile_main (fn, tstmt) =
  let env = empty_alloc_env () in
  alloc_vars env tstmt;
  let l = new_label () in
  let locals =
    if env.nb_total = 0 then nop
    else
      andq (imm (-8 * env.nb_total)) (reg rsp) in
  enter ++
  (* modify rsp according to the total number of
     local variables to allocate *)
  locals ++
  compile_stmt l tstmt ++
  xorq (reg rax) (reg rax)

let file ?debug:(b=false) (p: Ast.tfile) : X86_64.program =
  debug := b;
  match p with
  | [] -> assert false
  | m :: r ->
    let cfile =
      List.fold_left (fun a td -> a ++ compile_tdef td) nop r in
    { text = globl "main" ++ label "main" ++ compile_main m ++
             leave ++ cfile ++ inline preamble;
      data = inline data_inline; }
