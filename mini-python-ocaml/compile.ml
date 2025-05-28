
open Format
open X86_64
open Ast

let debug = ref false

let preamble = "

P_test: # argument in %rdi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    (%rdi), %rax
      cmpq    $0, %rax
      je      E_test
      movq    8(%rdi), %rax

E_test:
      movq    %rbp, %rsp
      popq    %rbp
      ret

P_print_None:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    $S_message_None, %rdi
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret
Get:
    pushq   %rbp
    movq    %rsp, %rbp

    movq    8(%rsi), %rcx        # rcx = index

    movq    8(%rdi), %rdx        # rdx = len(obj)

    testq   %rcx, %rcx
    js      Get_IndexError

    cmpq    %rdx, %rcx
    jae     Get_IndexError

    movq    16(%rdi), %rdx       # rdx = obj.data_ptr

    movq    (%rdx, %rcx, 8), %rax
            movq    %rbp, %rsp
      popq    %rbp
      ret
Get_IndexError:
    xorq    %rax, %rax
          movq    %rbp, %rsp
      popq    %rbp
      ret
P_print_string:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    %rdi, %rsi
      movq    $S_message_string, %rdi
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret

P_print_int:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    %rdi, %rsi
      leaq S_message_int(%rip), %rdi
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret    

P_print_bool:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    %rdi, %rsi
      cmpq    $0, %rdi
      jne     Ret_True
      movq    $S_bool_False, %rdi
      xorq    %rax, %rax
      call    printf
            movq    %rbp, %rsp
      popq    %rbp
      ret

Ret_True:
      movq    $S_bool_True, %rdi
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
      cmpq    $0, (%rdi) # is this None?
      je      0f
      cmpq    $1, (%rdi) # is this bool?
      je      1f
      cmpq    $2, (%rdi) # is this integer?
      je      2f
      cmpq    $3, (%rdi) # is this String?
      je      3f
      cmpq    $4, (%rdi)    # is this a list?
      je      4f

0:
      call    P_print_None
            movq    %rbp, %rsp
      popq    %rbp
      ret
4:
      jmp     End      
3:
      leaq    16(%rdi), %rdi
      call    P_print_string
            movq    %rbp, %rsp
      popq    %rbp
      ret
2:
      movq    8(%rdi), %rdi
      call    P_print_int
            movq    %rbp, %rsp
      popq    %rbp
      ret

1:
      movq    8(%rdi), %rdi
      call    P_print_bool
            movq    %rbp, %rsp
      popq    %rbp
      ret
B_eq:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rdi, %rsi
      sete    %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
      movq    %rbp, %rsp
      popq    %rbp
      ret
B_neq:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rdi, %rsi
      setne   %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
      movq    %rbp, %rsp
      popq    %rbp
      ret
B_lt:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rsi,%rdi 
      setl    %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
            movq    %rbp, %rsp
      popq    %rbp
      ret

B_le:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rsi,%rdi 
      setle   %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
            movq    %rbp, %rsp
      popq    %rbp
      ret
B_gt:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rsi,%rdi 
      setg    %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call      P_alloc_bool # allocate a boolean
      movq    %rbp, %rsp
      popq    %rbp
      ret
B_ge:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rsi,%rdi 
      setge   %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
      movq    %rbp, %rsp
      popq    %rbp
      ret

  B_and: 
    pushq   %rbp
    movq    %rsp, %rbp
    cmpq    $0, (%rdi)
    je      B_and_false
    cmpq    $0, 8(%rdi)
    je      B_and_false
    movq    %rsi, %rax
          movq    %rbp, %rsp
      popq    %rbp
      ret
  B_and_false:
    movq %rdi, %rax
          movq    %rbp, %rsp
      popq    %rbp
      ret

  B_or:
    pushq   %rbp
    movq    %rsp, %rbp
    cmpq    $0, (%rdi)
    je      B_or_true # if first argument is False, then return second
    cmpq    $0, 8(%rdi)
    je      B_or_true 
    movq    %rdi, %rax # if first argument is True, then return first
          movq    %rbp, %rsp
      popq    %rbp
      ret

  B_or_true:
    movq %rsi, %rax
          movq    %rbp, %rsp
      popq    %rbp
      ret
  

End:
      movq    %rbp, %rsp
      popq    %rbp
      ret

P_alloc_bool: # The boolean have structure: [1 | 0/1] init with 0
      pushq   %rbp
      movq    %rsp, %rbp
      pushq   %rdi        
      andq    $-16, %rsp  
      movq    $16, %rdi   
      call    malloc     
      movq    $1, (%rax)  # tag of a boolean block
      movq    -8(%rbp), %rdi 
      movq    %rdi, 8(%rax)  
        movq    %rbp, %rsp
      popq    %rbp
      ret
          
P_alloc_None:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    $16, %rdi   # allocate 16 bytes for None
      call    malloc
      movq    $0, (%rax)  # tag of a None block
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
      ret

P_alloc_list:
      pushq   %rbp
      movq    %rsp, %rbp
      pushq   %rdi        # the length of the list
      andq    $-16, %rsp  # stack alignment;
      shl     $3, %rdi    # 8 * %rdi
      addq    $16, %rdi   # %rdi = 16 + 8 * length of the list
      call    malloc
      movq    $4, (%rax)
      movq    -8(%rbp), %rdi
      movq    %rdi, 8(%rax)
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_alloc_str:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rsi         
    andq    $-16, %rsp   
    movq    $16, %rdi    
    call    malloc
    movq    $3, (%rax)  
    movq    -8(%rbp), %rsi
    movq    %rsi, 8(%rax)
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_print_newline:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
     leaq S_newline(%rip), %rdi
      xorq    %rax, %rax
      call    printf
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_add:
  pushq   %rbp
  movq    %rsp, %rbp
  cmpq    $3, (%rdi) # is first argument a string?
  je      P_add_str
  cmpq    $2, (%rdi) # is first argument an integer?
  je      P_add_int
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_add_int: # first argument in %rdi, second argument in %rsi
  pushq   %rbp
  movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      addq    8(%rsi), %rdi
      call    P_alloc_int
        movq    %rbp, %rsp
      popq    %rbp
      ret

F_len:
    pushq %rbp
    movq  %rsp, %rbp

    cmpq  $4, (%rdi)         #if list
    je    .valid
    cmpq  $3, (%rdi)         # if string
    je    .valid

    # The e is not valid attribute
    movq    $S_Error_Message_Type, %rdi
    xorq    %rax, %rax
    call    printf
    movq    $1,   %rdi
    call exit
.valid:
    movq  8(%rdi), %rdi    # reads the lenght
    call P_alloc_int
    movq    %rbp, %rsp
    popq    %rbp
    ret


P_range:
    pushq   %rbp
    movq    %rsp, %rbp

    # Save n on stack (for loop limit)
    pushq   %rdi

    movq    %rdi, %rdi         # length = n
    call    P_alloc_list       # returns pointer to list in %rax

    # Store list pointer in rbx for use in loop
    movq    %rax, %rbx

    popq    %rcx

    movq    $0, %rdx           # i = 0  
.loop:
    cmpq    %rdx, %rcx         # compare i and n
    jge     .done              # if i >= n sai se do loop

    # Calculate address of list[i]
    movq    %rdx, %rsi         # i
    shl     $3, %rsi           
    addq    $16, %rsi          # offset for list data after header
    addq    %rbx, %rsi         # address of list[i]

    # Store integer object at list[i]
    movq    $2, (%rsi)         # tag for int = 2
    movq    %rdx, 8(%rsi)      # value = i

    incq    %rdx              
    jmp     .loop
.done:
    movq    %rbx, %rax        
  
P_add_str:
    pushq   %rbp
    movq    %rsp, %rbp

    pushq   %rdi
    pushq   %rsi

    # load pointers to string contents
    movq    8(%rbp), %rdi   # rdi = ptr str1 saved in stack frame
    movq    16(%rbp), %rsi  # rsi = ptr str2 saved in stack frame

    movq    8(%rdi), %rdi   # rdi = pointer content str1
    movq    8(%rsi), %rsi   # rsi = pointer content str2

    # strlen(str1)
    movq    %rdi, %rax
    call    strlen
    movq    %rax, %rdx      # len1

    # strlen(str2)
    movq    %rsi, %rax
    call    strlen
    movq    %rax, %rcx      # len2

    # malloc(len1 + len2 + 1)
    movq    %rdx, %rax
    addq    %rcx, %rax
    addq    $1, %rax
    movq    %rax, %rdi
    call    malloc

    # strcpy new_buffer, str1
    movq    %rax, %rdi          # destiny objctive
    movq    8(%rbp), %rsi       # ptr str1 original (saved)
    movq    8(%rsi), %rsi       # pointer str1
    call    strcpy

    # strcpy new_buffer + len1, str2
    movq    %rax, %rdi
    addq    %rdx, %rdi
    movq    16(%rbp), %rsi    # ptr str2 original saved
    movq    8(%rsi), %rsi       # pointer str2
    call    strcpy

    # buils the object
    movq    $3, %rdi
    movq    %rax, %rsi
    call    P_alloc_str

    addq    $16, %rsp         # clean the stack

        movq    %rbp, %rsp
      popq    %rbp
      ret

P_sub_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      subq    8(%rsi), %rdi
      call    P_alloc_int
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_div_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rax
      cqto
      movq    8(%rsi), %rsi
      idivq   %rsi
      movq    %rax, %rdi
      call    P_alloc_int
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_mod_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rax
      cqto
      movq    8(%rsi), %rsi
      idivq   %rsi
      movq    %rdx, %rdi
      call    P_alloc_int
        movq    %rbp, %rsp
      popq    %rbp
      ret

P_mul_int:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      imulq   8(%rsi), %rdi
      call    P_alloc_int
        movq    %rbp, %rsp
      popq    %rbp
      ret


"

let data_inline = "
S_message_int:
  .string \"%d\"
S_message_string:
  .string \"%s\"
S_message_None:
  .string \"None\"
S_newline:
  .string \"\\n\"
S_bool_True:
  .string \"True\"
S_bool_False:
  .string \"False\"
S_Error_Message_Type:
  .string \"Type of param is not compatible\"

S_char_open_bracket:
  .string \"[\"
S_char_close_bracket:
  .string \"]\"
S_string_comma_space:
  .string \", \"

C_None:
  .quad 0
C_False:
  .quad 1
  .quad 0
C_True:
  .quad 1
  .quad 1
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

type string_env = (string, string) Hashtbl.t

let string_env : string_env = Hashtbl.create 16

let new_string =
  let c = ref 0 in
  fun s -> incr c;
    let l = "S_" ^ (string_of_int !c) in
    Hashtbl.add string_env l s;
    l

let rec fold_i f i acc l =
  match l with
  | [] -> acc
  | x :: r -> fold_i f (i + 1) (f i acc x) r

let rec compile_expr (e: Ast.texpr) =
  match e with
  | TEcst (Cint n) ->
      movq (imm64 n) (reg rdi) ++ call "P_alloc_int" ++
      movq (reg rax) (reg rdi)
  | TEcst Cnone ->
      movq (ilab "C_None") (reg rdi)
  | TEcst (Cstring s) ->
      let l = new_string s in
      movq (ilab l) (reg rdi)
  | TEcst (Cbool b) ->
      if b then movq (ilab "C_True") (reg rdi)
      else movq (ilab "C_False") (reg rdi)
  | TEvar x ->
      let ofs = x.v_ofs in
      movq (ind ~ofs rbp) (reg rdi)
  | TEbinop (binop, e1, e2) ->
     let op = match binop with
        | Badd -> "P_add_int" (*TODO: suppose P_add*)
        | Bsub -> "P_sub_int"
        | Bmul -> "P_mul_int"
        | Bdiv -> "P_div_int"
        | Bmod -> "P_mod_int"
        | Beq -> "B_eq"
        | Bneq -> "B_neq"
        | Blt -> "B_lt"
        | Ble -> "B_le"
        | Bgt -> "B_gt"
        | Bge -> "B_ge"
        | Band ->"B_and"
        | Bor ->"B_or"  
        | _ -> assert false  in
      compile_expr e1 ++ (* in %rdi *)
      pushq (reg rdi) ++
      compile_expr e2 ++
      movq (reg rdi) (reg rsi) ++ (* %rsi = e2 *)
      popq rdi ++ (* %rdi = e1 *)
      call op ++ (* result in %rax *)
      movq (reg rax) (reg rdi)
  | TEunop (_, _) -> assert false (* TODO *)
  | TEcall (fn, el) ->
      let push_arg e =
        compile_expr e ++
        pushq (reg rdi) in
      List.fold_left (fun a e -> push_arg e ++ a) nop el ++
      call ("F_" ^ fn.fn_name) ++
      addq (imm (8 * List.length el)) (reg rsp) ++
      movq (reg rax) (reg rdi)
  | TElist el ->
      let push_e acc e =
        compile_expr e ++ pushq (reg rdi) ++ acc in
      let pop_e i a e =
        let ofs = 16 + i * 8 in
        a ++ popq rdi ++ movq (reg rdi) (ind ~ofs rax) in
      List.fold_left push_e nop el ++
      movq (imm (List.length el)) (reg rdi) ++
      call "P_alloc_list" ++
      fold_i pop_e 0 nop el ++
      movq (reg rax) (reg rdi)
  | TErange e ->
    compile_expr e ++ (* in %rdi *)
    pushq (reg rdi) ++ (* save n on stack *)
    call "P_range" ++ (* result in %rax *)
    addq (imm 8) (reg rsp) ++ (* clean stack *)

  movq (reg rax) (reg rdi) (* result in %rdi *)
  | TEget (l, i) -> 
      compile_expr l ++ (* in %rdi *)
      compile_expr i ++ (* in %rsi *)
      call "Get" ++
      movq (reg rax) (reg rdi) (* result in %rdi *)

let rec compile_stmt exit_lbl (s: Ast.tstmt) =
  match s with
  | TSif (e, s1, s2) ->
      let l_else = new_label () in
      let l_end = new_label () in
      compile_expr e ++
      call "P_test" ++
      testq (reg rax) (reg rax) ++
      jz l_else ++
      compile_stmt exit_lbl s1 ++
      jmp l_end ++
      label l_else ++
      compile_stmt exit_lbl s2 ++
      label l_end
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
    else subq (imm (8 * env.nb_total)) (reg rsp) in
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
      subq (imm (8 * env.nb_total)) (reg rsp) in
  enter ++
  (* modify rsp according to the total number of
     local variables to allocate *)
  locals ++
  compile_stmt l tstmt ++
  xorq (reg rax) (reg rax)

let inline_strings () =
  let alloc_string l s acc =
    label l ++ dquad [3; String.length s] ++ string s ++ acc in
  Hashtbl.fold alloc_string string_env nop

let file ?debug:(b=false) (p: Ast.tfile) : X86_64.program =
  debug := b;
  match p with
  | [] -> assert false
  | m :: r ->
    let cmain = compile_main m ++ leave in
    let cfile =
      List.fold_left (fun a td -> a ++ compile_tdef td) nop r in
    { text = globl "main" ++ label "main" ++ cmain ++
             cfile ++ inline preamble;
      data = inline data_inline ++ inline_strings (); }
