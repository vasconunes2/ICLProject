	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call B_lt
	movq %rax, %rdi
	call P_print
	call P_print_newline
	xorq %rax, %rax
	movq %rbp, %rsp
	popq %rbp
	ret

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
      movq    $S_message_int, %rdi
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
Ret_False:
      movq    $S_bool_False, %rdi
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
      jne      Ret_True
      jmp      Ret_False

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
0:
      call    P_print_None
      jmp     End
3:
      leaq    16(%rdi), %rdi
      call    P_print_string
      jmp     End
2:
      movq    8(%rdi), %rdi
      call    P_print_int
      jmp     End

1:
      movq    8(%rdi), %rdi
      call    P_print_bool
      jmp     End
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
      cmpq    %rdi, %rsi
      setl    %al  #store the result in %al
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
      cmpq    %rdi, %rsi
      setg    %al  #store the result in %al
      movzbq  %al, %rdi # zero extend %al to %rdi
      call    P_alloc_bool # allocate a boolean
      movq    %rbp, %rsp
      popq    %rbp
      ret
B_ge:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      movq    8(%rsi), %rsi
      cmpq    %rdi, %rsi
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
    jmp End
  B_and_false:
    movq %rdi, %rax
    jmp End

  B_or:
    pushq   %rbp
    movq    %rsp, %rbp
    cmpq    $0, (%rdi)
    je      B_or_true # if first argument is False, then return second
    cmpq    $0, 8(%rdi)
    je      B_or_true 
    movq    %rdi, %rax # if first argument is True, then return first
    jmp End

  B_or_true:
    movq %rsi, %rax
    jmp End
  

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
  jmp End
          
P_alloc_None:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    $16, %rdi   # allocate 16 bytes for None
      call    malloc
      movq    $0, (%rax)  # tag of a None block
  jmp End

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
  jmp End

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
  jmp End

    
P_print_newline:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      movq    $S_newline, %rdi
      xorq    %rax, %rax
      call    printf
  jmp End

P_add_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      addq    8(%rsi), %rdi
      call    P_alloc_int
  jmp End

P_sub_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      subq    8(%rsi), %rdi
      call    P_alloc_int
  jmp End

P_div_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rax
      cqto
      movq    8(%rsi), %rsi
      idivq   %rsi
      movq    %rax, %rdi
      call    P_alloc_int
  jmp End

P_mod_int: # first argument in %rdi, second argument in %rsi
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rax
      cqto
      movq    8(%rsi), %rsi
      idivq   %rsi
      movq    %rdx, %rdi
      call    P_alloc_int
  jmp End

P_mul_int:
      pushq   %rbp
      movq    %rsp, %rbp
      movq    8(%rdi), %rdi
      imulq   8(%rsi), %rdi
      call    P_alloc_int
  jmp End


	.data

S_message_int:
  .string    "%d"
S_message_string:
  .string    "%s"
S_message_None:
  .string    "None"
S_newline:
  .string    "\n"
S_bool_True:
  .string "True"
S_bool_False:
  .string "False"

C_None:
  .quad       0
C_False:
  .quad       1
  .quad       0
C_True:
  .quad       1
  .quad       1
