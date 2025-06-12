	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call B_neq
	movq %rax, %rdi
	call P_print
	call P_print_newline
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call B_eq
	movq %rax, %rdi
	call P_print
	call P_print_newline
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call B_eq
	movq %rax, %rdi
	call P_print
	call P_print_newline
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq -8(%rbp), %rdi
	pushq %rdi
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq -8(%rbp), %rdi
	pushq %rdi
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	movq %rax, %rdi
	pushq %rdi
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call B_eq
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
P_print_list:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
      xorq    %rax, %rax
      call    printf
      movq    %rbp, %rsp
      popq    %rbp
      ret
P_print_list_elem:
      pushq   %rbp
      movq    %rsp, %rbp
      andq    $-16, %rsp
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
      call    P_print_list
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
      call    P_alloc_bool # allocate a boolean
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
F_len:
    pushq %rbp
    movq  %rsp, %rbp

    cmpq  $4, (%rdi)         #if list
    je    TypeValid
    cmpq  $3, (%rdi)         # if string
    je    TypeValid

TypeError:
    movq    $S_Error_Message_Type, %rdi
    xorq    %rax, %rax
    call    printf
    movq    $1,   %rdi
    call exit

TypeValid:
    movq  8(%rdi), %rdi    # reads the lenght
    call P_alloc_int
    movq    %rbp, %rsp
    popq    %rbp
    ret

P_add:
    pushq   %rbp
    movq    %rsp, %rbp

    cmpq    $3, (%rdi)     # is a1 a string?
    je      add_str
    cmpq    $2, (%rdi)     # is a1 an integer?
    jne     TypeError
    cmpq    $2, (%rsi)     # is a2 an integer?
    jne     TypeError
    movq    8(%rdi), %r14  # load a1's value into %rbx
    addq    8(%rsi), %r14  # add a2's value to %rbx

    movq    $16, %rdi
    call    malloc
    testq   %rax, %rax
    jz      malloc_failed

    movq    $2, (%rax)     # type = integer
    movq    %r14, 8(%rax)  # store result value in new object
    jmp done
add_str:
    cmpq    $3, (%rsi)        # is a2 a string?
    jne     TypeError

    movq    %rdi, %r12        # save s1
    movq    %rsi, %r13        # save s2

    movq    8(%r12), %r14     # length of s1
    addq    8(%r13), %r14     # total length = s1 + s2

    # allocate string object (16-byte header + data + null terminator)
    movq    %r14, %rdi
    addq    $17, %rdi         # 16-byte header + (length + 1)
    call    malloc
    testq   %rax, %rax
    jz      malloc_failed
    movq    %rax, %rbx        # new object → %rbx

    # initialize object header
    movq    $3, (%rbx)        # type = string
    movq    %r14, 8(%rbx)     # store total length

    # data section starts at offset 16
    leaq    16(%rbx), %rdi    # destination address

    leaq    16(%r12), %rsi    # s1 data address
    movq    8(%r12), %rdx     # s1 length
    testq   %rdx, %rdx        # is length 0?
    jz      copy_s2           # skip copy if zero

    call    my_memcpy         # copy s1 data

    leaq    16(%rbx), %rdi    # reload destination base
    addq    8(%r12), %rdi     # move past s1 data

copy_s2:
    leaq    16(%r13), %rsi    # s2 data address
    movq    8(%r13), %rdx     # s2 length
    testq   %rdx, %rdx        # is length 0?
    jz      add_null          # skip copy if zero
    call    my_memcpy         # copy s2 data

add_null:
    leaq    16(%rbx), %rax    # start of data section
    addq    8(%rbx), %rax     # move to end
    movb    $0, (%rax)        # add null terminator

    movq    %rbx, %rax        # return new object
    jmp     done

my_memcpy:
    pushq   %rbp
    movq    %rsp, %rbp

    testq   %rdx, %rdx
    jz      done
    movq    %rdi, %rax        # save destination as return value

    movq    %rdx, %rcx        # use rcx as counter

cpy_by_byte:
    movb    (%rsi), %r8b      # load byte from source
    movb    %r8b, (%rdi)      # store byte to destination
    incq    %rsi              # increment source pointer
    incq    %rdi              # increment destination pointer
    decq    %rcx              # decrement counter
    jnz     cpy_by_byte       # loop if not zero

done:
    popq    %rbp
    ret


malloc_failed:
    leaq    S_Error_Message_Malloc(%rip), %rdi
    xorq    %rax, %rax
    call    printf
    movq    $1, %rdi
    call    exit

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
index_out_of_bounds:
      pushq   %rbp
      movq    %rsp, %rbp
      leaq S_Error_Message_Index(%rip), %rdi
      xorq    %rax, %rax
      call printf
      movq $1, %rdi
      call exit

L_skip:
    nop
	.data

S_message_int:
  .string "%d"
S_message_string:
  .string "%s"
S_message_None:
  .string "None"
S_newline:
  .string "\n"
S_bool_True:
  .string "True"
S_bool_False:
  .string "False"
S_Error_Message_Type:
  .string "Type of param is not compatible"
S_Error_Message_Malloc:
  .string "Memory allocation failed"
S_Error_Message_Index:
  .string "Index out of bounds"
S_char_open_bracket:
  .string "["
S_char_close_bracket:
  .string "]"
S_string_comma_space:
  .string ", "

C_None:
  .quad 0
C_False:
  .quad 1
  .quad 0
C_True:
  .quad 1
  .quad 1
