
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
    cmpq    $4, (%rdi)     # is a1 a list?
    je      add_list
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
add_list:
    cmpq    $4, (%rsi)
    jne     TypeError # if a2 is not a list, raise TypeError
    
    pushq   %rsi # save a2
    pushq   %rdi # save a1
    
    movq    8(%rdi), %rdi # length of a1
    addq    8(%rsi), %rdi # total length = a1.len + a2.len
    pushq %rdi

    shlq    $3, %rdi
    addq    $16, %rdi
    call    malloc
    testq   %rax, %rax # alloc list
    jz      malloc_failed
    popq   %rdi # restore rdi
    # Now, %rax points to the new list object
    movq    $4, (%rax) # rax.tag = 4
    movq    %rdi, 8(%rax) # rax.len =  total length

    popq   %rsi # restore a1 to rsi
    movq    8(%rsi), %rdx # rsi = a1.len
    testq   %rdx, %rdx
    jz      copy_a2_data

    movq    8(%rsi), %rdx # rsi = a1
    shlq    $3, %rdx
    leaq    16(%rax), %rdi # rdi = rax.ptr
    leaq    16(%rsi), %rsi # rsi = a1.ptr

    pushq   %rax # save rax/Pointer to the new list
    call    my_memcpy # rdi = rax.ptr, rsi = a1.ptr, rdx = a1.length
    popq    %rax   # restore rax
copy_a2_data:
    popq    %rsi # restore a2 to rsi
    movq    8(%rsi), %rdx # rdi = a2.len
    testq   %rdx, %rdx # if a2.len == 0
    jz      done
    
    leaq    16(%rsi), %rsi  # rsi = a2.ptr
    shlq    $3, %rdx
    pushq %rax
    call    my_memcpy
    popq   %rax # restore rax/Pointer to the new list
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
# copy %rdx bytes from %rsi to %rdi
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
    pushq   %rbp
    movq    %rsp, %rbp
    cmpq    $2, (%rdi)          # check if the first argument is a integer
    jne     TypeError            # if not, raise TypeError
    movq    8(%rdi), %rsi       # rsi = n
    movq    %rsi, %rdi          # prepare argument for P_alloc_list
    pushq  %rsi
    call    P_alloc_list        # rax = list pointer
    popq   %rsi                # restore n
    testq   %rax, %rax
    jz      malloc_failed

    xorq    %rcx, %rcx          # rcx = i = 0
P_range_loop:
    cmpq    %rsi, %rcx
    jge     P_range_end         # if i >= n, exit loop
    pushq %rax
    pushq %rcx                  # save i
    movq    %rcx, %rdi
    pushq %rsi
    call    P_alloc_int         # rax = int pointer

    testq   %rax, %rax
    jz      malloc_failed
    movq    %rax, %r8          # r8 = int pointer
    popq    %rsi                # restore n
    popq    %rcx                # restore i
    popq    %rax                # restore list pointer in rax
    movq    %r8, 16(%rax, %rcx, 8)   # list[i] = int pointer

    incq    %rcx
    jmp     P_range_loop

P_range_end:
    movq    %rbp, %rsp
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
P_equal:
    pushq %rbp
    movq %rsp, %rbp

    movq (%rdi), %rax        # load tag of first argument
    movq (%rsi), %rbx        # load tag of second argument

    cmpq $0, %rax
    je P_equal_None

    cmpq $1, %rax
    je P_equal_int

    cmpq $2, %rax
    je P_equal_int

    cmpq %rbx, %rax          # tag mismatch?
    jne P_not_equal

    cmpq $3, %rax
    je P_equal_string

    cmpq $4, %rax
    je P_equal_list

    # fallback to identity compare
    cmpq %rdi, %rsi
    sete %al
    movzx %al, %rax
    jmp P_equal_done

P_equal_None:
    cmpq $0, %rbx
    je P_is_equal            # both are None
    jmp P_not_equal

P_equal_int:
    cmpq $0, %rbx
    je P_not_equal           # second argument is not an integer
    cmpq $3, %rbx            #  is it a string?
    je P_not_equal           # second argument is not an integer
    cmpq $4, %rbx            # is it a list?
    je P_not_equal           # second argument is not an integer

    movq 8(%rdi), %rax       # value1
    movq 8(%rsi), %rbx       # value2
    subq %rbx, %rax
    jmp P_equal_done

P_equal_string:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jne P_not_equal
    testq %rax, %rax
    jz P_equal_done            # both length 0 = equal

    leaq 16(%rdi), %rdi      # str1 content
    leaq 16(%rsi), %rsi      # str2 content
    movq %rax, %rcx          # counter = length

P_equal_string_loop:
    testq %rcx, %rcx
    jz P_is_equal
    movzbq (%rdi), %rax
    movzbq (%rsi), %rbx
    cmpq %rax, %rbx
    jne P_not_equal
    inc %rdi
    inc %rsi
    dec %rcx
    jmp P_equal_string_loop

P_equal_list:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jne P_not_equal
    testq %rax, %rax
    jz P_equal_done

    leaq 16(%rdi), %rdi      # elements1
    leaq 16(%rsi), %rsi      # elements2
    movq %rax, %rcx          # counter = length

P_equal_list_loop:
    testq %rcx, %rcx
    jz P_equal_done

    movq (%rdi), %rax        # load element1
    movq (%rsi), %rbx        # load element2
    pushq %rcx
    pushq %rdi
    pushq %rsi
    movq %rax, %rdi
    movq %rbx, %rsi
    call P_equal
    popq %rsi
    popq %rdi
    popq %rcx
    testq %rax, %rax
    jne P_equal_done

    addq $8, %rdi
    addq $8, %rsi
    dec %rcx
    jmp P_equal_list_loop

P_is_equal:
    movq $0, %rax            # return 0 = True
    jmp P_equal_done

P_not_equal:
    movq $1, %rax            # return 1 = False

P_equal_done:
    movq %rbp, %rsp
    popq %rbp
    ret
P_le:
    pushq %rbp
    movq %rsp, %rbp

    movq (%rdi), %rax        # load tag of first argument
    movq (%rsi), %rbx        # load tag of second argument

    cmpq $0, %rax
    je TypeError

    cmpq $1, %rax #bool
    je P_equal_int

    cmpq $2, %rax #int
    je P_equal_int

    cmpq %rbx, %rax
    jne TypeError  # if tag different

    cmpq $3, %rax
    je P_le_string

    cmpq $4, %rax
    je P_le_list

    # fallback to identity compare
    cmpq %rdi, %rsi
    setle %al
    movzx %al, %rax
    jmp P_le_done
P_le_string:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jg P_le_done              # if length1 > length2, return False
    testq %rax, %rax
    jz P_le_done              # if both lengths are 0, return True

    leaq 16(%rdi), %rdi      # str1 content
    leaq 16(%rsi), %rsi      # str2 content
    movq %rax, %rcx          # counter = length
P_le_string_loop:
    testq %rcx, %rcx
    jz P_le_done              # if counter is 0, return True
    movzbq (%rdi), %rax       # load byte from str1
    movzbq (%rsi), %rbx       # load byte from str2
    cmpq %rax, %rbx
    jl P_le_done              # if byte1 < byte2, return True
    jne P_gt_done             # if byte1 != byte2, return False
    inc %rdi                  # move to next byte in str1
    inc %rsi                  # move to next byte in str2
    dec %rcx                  # decrement counter
    jmp P_le_string_loop
P_le_list:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jg P_le_done              # if length1 > length2, return False
    testq %rax, %rax
    jz P_le_done              # if both lengths are 0, return True

    leaq 16(%rdi), %rdi      # elements1
    leaq 16(%rsi), %rsi      # elements2
    movq %rax, %rcx          # counter = length
P_le_list_loop:
    testq %rcx, %rcx
    jz P_le_done              # if counter is 0, return True

    movq (%rdi), %rax        # load element1
    movq (%rsi), %rbx        # load element2
    pushq %rcx
    pushq %rdi
    pushq %rsi
    movq %rax, %rdi
    movq %rbx, %rsi
    call P_le
    popq %rsi
    popq %rdi
    popq %rcx
    testq %rax, %rax
    jne P_le_done

    addq $8, %rdi
    addq $8, %rsi
    dec %rcx
    jmp P_le_list_loop
P_le_done:
    movq %rbp, %rsp
    popq %rbp
    ret
P_lt:
    pushq %rbp
    movq %rsp, %rbp

    movq (%rdi), %rax        # load tag of first argument
    movq (%rsi), %rbx        # load tag of second argument

    cmpq $0, %rax
    je TypeError

    cmpq $1, %rax #bool
    je P_equal_int

    cmpq $2, %rax #int
    je P_equal_int

    cmpq %rbx, %rax
    jne TypeError  # if tag different

    cmpq $3, %rax
    je P_lt_string

    cmpq $4, %rax
    je P_lt_list

    # fallback to identity compare
    cmpq %rdi, %rsi
    setl %al
    movzx %al, %rax
    jmp P_lt_done
P_lt_string:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jge P_lt_done             # if length1 >= length2, return False
    testq %rax, %rax
    jz P_lt_done              # if both lengths are 0, return False

    leaq 16(%rdi), %rdi      # str1 content
    leaq 16(%rsi), %rsi      # str2 content
    movq %rax, %rcx          # counter = length
P_lt_string_loop:
    testq %rcx, %rcx
    jz P_lt_done              # if counter is 0, return False
    movzbq (%rdi), %rax       # load byte from str1
    movzbq (%rsi), %rbx       # load byte from str2
    cmpq %rax, %rbx
    jge P_lt_done             # if byte1 >= byte2, return False
    jne P_gt_done             # if byte1 != byte2, return True
    inc %rdi                  # move to next byte in str1
    inc %rsi                  # move to next byte in str2
    dec %rcx                  # decrement counter
    jmp P_lt_string_loop
P_lt_list:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jge P_lt_done             # if length1 >= length2, return False
    testq %rax, %rax
    jz P_lt_done              # if both lengths are 0, return False

    leaq 16(%rdi), %rdi      # elements1
    leaq 16(%rsi), %rsi      # elements2
    movq %rax, %rcx          # counter = length
P_lt_list_loop:
    testq %rcx, %rcx
    jz P_lt_done              # if counter is 0, return False

    movq (%rdi), %rax        # load element1
    movq (%rsi), %rbx        # load element2
    pushq %rcx
    pushq %rdi
    pushq %rsi
    movq %rax, %rdi
    movq %rbx, %rsi
    call P_lt
    popq %rsi
    popq %rdi
    popq %rcx
    testq %rax, %rax
    jne P_lt_done

    addq $8, %rdi
    addq $8, %rsi
    dec %rcx
    jmp P_lt_list_loop
P_lt_done:
    movq %rbp, %rsp
    popq %rbp
    ret
P_ge:
    pushq %rbp
    movq %rsp, %rbp

    movq (%rdi), %rax        # load tag of first argument
    movq (%rsi), %rbx        # load tag of second argument

    cmpq $0, %rax
    je TypeError

    cmpq $1, %rax #bool
    je P_equal_int

    cmpq $2, %rax #int
    je P_equal_int

    cmpq %rbx, %rax
    jne TypeError  # if tag different

    cmpq $3, %rax
    je P_ge_string

    cmpq $4, %rax
    je P_ge_list

    # fallback to identity compare
    cmpq %rdi, %rsi
    setge %al
    movzx %al, %rax
    jmp P_ge_done
P_ge_string:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jl P_ge_done              # if length1 < length2, return False
    testq %rax, %rax
    jz P_ge_done              # if both lengths are 0, return True

    leaq 16(%rdi), %rdi      # str1 content
    leaq 16(%rsi), %rsi      # str2 content
    movq %rax, %rcx          # counter = length
P_ge_string_loop:
    testq %rcx, %rcx
    jz P_ge_done              # if counter is 0, return True
    movzbq (%rdi), %rax       # load byte from str1
    movzbq (%rsi), %rbx       # load byte from str2
    cmpq %rax, %rbx
    jg P_ge_done              # if byte1 > byte2, return True
    jne P_gt_done             # if byte1 != byte2, return False
    inc %rdi                  # move to next byte in str1
    inc %rsi                  # move to next byte in str2
    dec %rcx                  # decrement counter
    jmp P_ge_string_loop
P_ge_list:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jl P_ge_done              # if length1 < length2, return False
    testq %rax, %rax
    jz P_ge_done              # if both lengths are 0, return True

    leaq 16(%rdi), %rdi      # elements1
    leaq 16(%rsi), %rsi      # elements2
    movq %rax, %rcx          # counter = length
P_ge_list_loop:
    testq %rcx, %rcx
    jz P_ge_done              # if counter is 0, return True

    movq (%rdi), %rax        # load element1
    movq (%rsi), %rbx        # load element2
    pushq %rcx
    pushq %rdi
    pushq %rsi
    movq %rax, %rdi
    movq %rbx, %rsi
    call P_ge
    popq %rsi
    popq %rdi
    popq %rcx
    testq %rax, %rax
    jne P_ge_done

    addq $8, %rdi
    addq $8, %rsi
    dec %rcx
    jmp P_ge_list_loop
P_ge_done:
    movq %rbp, %rsp
    popq %rbp
    ret
P_gt:
    pushq %rbp
    movq %rsp, %rbp

    movq (%rdi), %rax        # load tag of first argument
    movq (%rsi), %rbx        # load tag of second argument

    cmpq $0, %rax
    je TypeError

    cmpq $1, %rax #bool
    je P_equal_int

    cmpq $2, %rax #int
    je P_equal_int

    cmpq %rbx, %rax
    jne TypeError  # if tag different

    cmpq $3, %rax
    je P_gt_string

    cmpq $4, %rax
    je P_gt_list

    # fallback to identity compare
    cmpq %rdi, %rsi
    setg %al
    movzx %al, %rax
    jmp P_gt_done
P_gt_string:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jle P_gt_done             # if length1 <= length2, return False
    testq %rax, %rax
    jz P_gt_done              # if both lengths are 0, return False

    leaq 16(%rdi), %rdi      # str1 content
    leaq 16(%rsi), %rsi      # str2 content
    movq %rax, %rcx          # counter = length
P_gt_string_loop:
    testq %rcx, %rcx
    jz P_gt_done              # if counter is 0, return False
    movzbq (%rdi), %rax       # load byte from str1
    movzbq (%rsi), %rbx       # load byte from str2
    cmpq %rax, %rbx
    jle P_gt_done             # if byte1 <= byte2, return False
    jne P_gt_done             # if byte1 != byte2, return True
    inc %rdi                  # move to next byte in str1
    inc %rsi                  # move to next byte in str2
    dec %rcx                  # decrement counter
    jmp P_gt_string_loop
P_gt_list:
    movq 8(%rdi), %rax       # length1
    movq 8(%rsi), %rbx       # length2
    cmpq %rbx, %rax
    jle P_gt_done             # if length1 <= length2, return False
    testq %rax, %rax
    jz P_gt_done              # if both lengths are 0, return False

    leaq 16(%rdi), %rdi      # elements1
    leaq 16(%rsi), %rsi      # elements2
    movq %rax, %rcx          # counter = length
P_gt_list_loop:
    testq %rcx, %rcx
    jz P_gt_done              # if counter is 0, return False

    movq (%rdi), %rax        # load element1
    movq (%rsi), %rbx        # load element2
    pushq %rcx
    pushq %rdi
    pushq %rsi
    movq %rax, %rdi
    movq %rbx, %rsi
    call P_gt
    popq %rsi
    popq %rdi
    popq %rcx
    testq %rax, %rax
    jne P_gt_done

    addq $8, %rdi
    addq $8, %rsi
    dec %rcx
    jmp P_gt_list_loop
P_gt_done:
    movq %rbp, %rsp
    popq %rbp
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
S_Error_Message_Malloc:
  .string \"Memory allocation failed\"
S_Error_Message_Index:
  .string \"Index out of bounds\"
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
      begin match binop with
      | Band | Bor ->
          let l_skip = new_label () in
          let l_done = new_label () in
          let jmp_cond = match binop with
            | Band -> jz l_skip   (* if false, skip e2 *)
            | Bor  -> jnz l_skip  (* if true, skip e2 *)
            | _ -> assert false
          in
          compile_expr e1 ++
          call "P_test" ++
          testq (reg rax) (reg rax) ++
          jmp_cond ++
          compile_expr e2 ++
          jmp l_done ++
          label l_skip ++
          nop ++
          label l_done
      | Beq | Bneq ->
           let ops = match binop with
           | Beq ->     call "P_equal" ++
                        testq (reg rax) (reg rax) ++
                        sete (reg al)
            | Bneq ->   call "P_equal" ++
                        testq (reg rax) (reg rax) ++
                        setne (reg al)
            | _ -> assert false in
        compile_expr e1 ++
        pushq (reg rdi) ++
        compile_expr e2 ++
        movq (reg rdi) (reg rsi) ++ 
        popq rdi ++
        ops ++
        movq (ilab  "C_True") (reg rdi) ++
        movq (ilab "C_False") (reg rsi) ++
        testb (reg al) (reg al) ++
        cmovz (reg rsi) (reg rdi) 
      |Ble|Blt|Bge|Bgt ->
        let ops = match binop with
          | Ble -> call "P_le" ++
                   testq (reg rax) (reg rax) ++
                   setle (reg al)
          | Blt -> call "P_lt" ++
                   testq (reg rax) (reg rax) ++
                   setl (reg al)
          | Bge -> call "P_ge" ++
                   testq (reg rax) (reg rax) ++
                   setge (reg al)
          | Bgt -> call "P_gt" ++
                   testq (reg rax) (reg rax) ++
                   setg (reg al)
          | _ -> assert false in
        compile_expr e1 ++
        pushq (reg rdi) ++
        compile_expr e2 ++
        movq (reg rdi) (reg rsi) ++
        popq rdi ++
        ops ++
        movq (ilab  "C_True") (reg rdi) ++
        movq (ilab "C_False") (reg rsi) ++
        testb (reg al) (reg al) ++
        cmovz (reg rsi) (reg rdi) 
    | _ ->
        let op = match binop with
          | Badd -> "P_add"
          | Bsub -> "P_sub_int"
          | Bmul -> "P_mul_int"
          | Bdiv -> "P_div_int"
          | Bmod -> "P_mod_int"
          | _ -> assert false in
        compile_expr e1 ++
        pushq (reg rdi) ++
        compile_expr e2 ++
        movq (reg rdi) (reg rsi) ++
        popq rdi ++ 
        call op ++
        movq (reg rax) (reg rdi)
    end
  | TEunop (_, _) -> nop (* TODO: implement unary operators *)
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
  call "P_range" ++ (* result in %rax *)
  movq (reg rax) (reg rdi) (* result in %rdi *)
| TEget (e1, e2) ->
    compile_expr e1 ++
    pushq (reg rdi) ++
    compile_expr e2 ++
    movq (reg rdi) (reg rsi) ++
    movq (ind ~ofs:8 rsi) (reg rsi) ++
    popq rdi ++
    cmpq (imm 0) (reg rsi) ++
    jl "index_out_of_bounds" ++
    movq (ind ~ofs:8 rdi) (reg rcx) ++
    cmpq (reg rcx) (reg rsi) ++
    jge "index_out_of_bounds" ++
    movq (ind ~ofs:16 ~index:rsi ~scale:8 rdi) (reg rdi) (* rdi = list[rsi]*)

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
| TSfor (v, r, s) ->
    let ofsv = v.v_ofs in
    let l_start = new_label () in
    let l_end = new_label () in
    let l_stmt = new_label () in
    compile_expr r ++                (* r in %rdi: list object *)
    movq (ind ~ofs:8 rdi) (reg rcx) ++           (* rcx = len *)
    leaq (ind ~ofs:16 ~index:rcx ~scale:8 rdi) rcx ++  (* rcx = end ptr *)
    pushq (reg rcx) ++               (* push end *)
    leaq (ind ~ofs:16 rdi) rcx ++    (* rcx = start ptr *)
    pushq (reg rcx) ++               (* push current ptr *)

    label l_start ++
    movq (ind ~ofs:0 rsp) (reg rdi) ++   (* rdi = current ptr *)
    movq (ind ~ofs:8 rsp) (reg rsi) ++   (* rsi = end ptr *)
    cmpq (reg rsi) (reg rdi) ++
    je l_end ++

    movq (ind rdi) (reg rcx) ++
    movq (reg rcx) (ind ~ofs:ofsv rbp) ++  
    addq (imm 8) (reg rdi) ++
    movq (reg rdi) (ind ~ofs:0 rsp) ++

    compile_stmt l_stmt s ++
    jmp l_start ++

    label l_end ++
    addq (imm 16) (reg rsp)

  | TSeval e ->
      compile_expr e
  | TSset (l, i, v) -> 
      compile_expr l ++ (* l in %rdi *)
      pushq (reg rdi) ++ (* save l on stack *)
      compile_expr i ++ (* i in %rdi *)
      movq (reg rdi) (reg rsi) ++ (* i in %rsi *)
      pushq (reg rsi) ++ (* save i on stack *)
      compile_expr v ++ (* v in %rdi *)
      popq rsi ++
      movq (ind ~ofs:8 rsi) (reg rsi) ++ (* rsi = i *)
      popq rbx ++ (* restore l in rbx *)
      (*We have l allocate in rbx, i in rsi and v in rdi*)
      cmpq (imm 0) (reg rsi) ++
      jl "index_out_of_bounds" ++
      movq (ind ~ofs:8 rdi) (reg rcx) ++
      cmpq (reg rcx) (reg rsi) ++
      jge "index_out_of_bounds" ++
      movq (reg rdi) (ind ~ofs:16 ~index:rsi ~scale:8 rbx) (*l[i] = v*)

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
  movq (ilab "C_None") (reg rax) ++
  label exit_lbl ++ (* introduce exit label *)
  (*if the function have no return, then return None as implicitly*)
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
