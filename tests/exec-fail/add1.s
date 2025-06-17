	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $S_1, %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_add
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
    pushq   %rdi
    xorq    %rax, %rax
    leaq    S_char_open_bracket(%rip), %rdi 
    call    printf

    popq    %rdi
    pushq   %rdi
    
    movq    8(%rdi), %rsi
    cmpq    $0, %rsi
    je      .print_list_end

    movq    $0, %rax

.print_list_loop:
    cmpq    %rax, %rsi
    je      .print_list_end

    movq    %rax, %rcx
    shlq    $3, %rcx
    leaq    16(%rdi, %rcx), %rcx
    
    pushq   %rdi
    pushq   %rsi
    pushq   %rax
    
    movq    (%rcx), %rdi 
    call    P_print
    
    popq    %rax
    popq    %rsi
    popq    %rdi
    
    incq    %rax
    cmpq    %rax, %rsi
    je      .print_list_end
    
    pushq   %rdi
    pushq   %rsi
    pushq   %rax
    leaq    S_string_comma_space(%rip), %rdi
    xorq    %rax, %rax
    call    printf
    popq    %rax
    popq    %rsi
    popq    %rdi
    
    jmp     .print_list_loop

.print_list_end:
    pushq   %rdi
    leaq    S_char_close_bracket(%rip), %rdi
    xorq    %rax, %rax
    call    printf
    popq    %rdi
    
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
      leaq    S_message_int(%rip), %rdi
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
      movq    %rbp, %rsp
      popq    %rbp
      ret
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

P_Biop_check_ops:
      cmpq  $1,  %r12 # if r12 is neq
      je P_Biop_True # if r12 is neq, return True
      cmpq  $0,  %r12 # if r12 is eq
      jne TypeError # if r12 is eq, return False
      jmp P_Biop_True # if r12 is eq, return False

P_Biop_int:
      cmpq    $2, (%rsi) # if rsi is int
      jne     P_Biop_check_ops
      movq 8(%rdi), %rdi # get the value of the first argument
      movq 8(%rsi), %rsi # get the value of the second argument
      movq %rdi, %rax # move the value of the first argument to rax
      subq %rsi, %rax # subtract the value of the second argument from rax
      jmp P_Biop_End

P_Biop_Bool:
      cmpq    $1, (%rsi) # if rsi is bool
      jne     P_Biop_check_ops # if rsi is not a boolean, return False
      movq 8(%rdi), %rdi # get the value of the first argument
      movq 8(%rsi), %rsi # get the value of the second argument
      movq %rdi, %rax # move the value of the first argument to rax
      subq %rsi, %rax # subtract the value of the second argument from rax
      jmp P_Biop_End


P_Biop_string:
      cmpq    $3, (%rsi) # if rsi is string
      jne     P_Biop_check_ops # if rsi is not a string, check the operator
      movq 8(%rdi), %rax # get length of the first argument, keep it in rcx
      cmpq $0, %rax # check if the first string is empty
      je P_Biop_False # if it is empty, return False

      # now we compare the strings
      leaq 16(%rdi), %rdi # rdi points to the first character of the first string
      leaq 16(%rsi), %rsi # rsi points to the first character of the second string
P_Biop_string_loop:
      testq %rcx, %rcx # check if we reached the end of the first string


        movzbl (%rdi), %eax # temp1 = rdi[0] 
      movzbl (%rsi), %ebx #  temp2 = rsi[0]
      subl %ebx, %eax # subtract the second character from the first
      movslq %eax, %rax  # sign-extend the result to rax

      decq %rcx # move to the next character in the first string
      incq %rdi # move to the next character in the first string
      incq %rsi # move to the next character in the second string
      jmp P_Biop_string_loop # repeat the loop

P_Biop_list:
      cmpq    $4, (%rsi) # if rsi is list
      jne     P_Biop_check_ops

      movq 8(%rdi), %rcx # len1 = arg1 length
      movq 8(%rsi), %rdx # len2 = arg2 length
      cmpq %rcx, %rdx #  b = len1 == len2
      jne P_Biop_False # if b != True , return False
      
      movq $0, %rbx # i = 0, we will use rbx as the index for the loop
P_Biop_list_loop:
      cmpq %rbx, %rcx
      je P_Biop_True # if we reached the end, return True

      movq 16(%rdi, %rbx, 8), %r10  # r10 = left[i]
      movq 16(%rsi, %rbx, 8), %r11  # r11 = right[i]
      pushq %rdi # save rdi
      pushq %rsi # save rsi
      movq %r10, %rdi # move the first element of the first list to rdi
      movq %r11, %rsi # move the first element of the second list to rsi
      call P_Biop # P_Biop(left[i], right[i])
      popq %rsi # restore rsi
      popq %rdi # restore rdi
      testq %rax, %rax
      jne P_Biop_False
 
      incq %rbx # i++
      jmp P_Biop_list_loop

P_Biop_None: # rdi is None already, check rsi 
      cmpq    $0, (%rsi) # if rsi is None
      jne     P_Biop_False # if rsi is not None, return False
      jmp     P_Biop_True # if rsi is None, return True
P_Biop:
      pushq   %rbp
      movq    %rsp, %rbp
      cmpq    $2, (%rdi) # if rdi is an integer
      je      P_Biop_int # 
      cmpq    $3, (%rdi) # if rdi is a string
      je      P_Biop_string # 
      cmpq    $4, (%rdi) # if rdi is a list
      je      P_Biop_list #
      cmpq    $0, (%rdi) # if rdi is None
      je      P_Biop_None # 
      cmpq    $1, (%rdi) # if rdi is a boolean
      je      P_Biop_Bool #
      jmp     P_Biop_False # if rdi is not a valid type, return False
P_Biop_True:
      movq    $1, %rax # if equal, return True
      jmp    P_Biop_End # jump to End
P_Biop_False:
      movq    $0, %rax
      jmp    P_Biop_End
P_Biop_End:
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

P_range:

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
S_1:
	.quad 3, 3
	.string "foo"
