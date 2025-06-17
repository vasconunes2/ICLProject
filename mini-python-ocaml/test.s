	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $544, %rsp
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
	pushq %rdi
	movq $0, %rdi
	call P_alloc_list
	movq %rax, %rdi
	pushq %rdi
	movq $C_None, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $S_1, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $8, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	popq %rdi
	movq %rdi, 40(%rax)
	popq %rdi
	movq %rdi, 48(%rax)
	popq %rdi
	movq %rdi, 56(%rax)
	popq %rdi
	movq %rdi, 64(%rax)
	popq %rdi
	movq %rdi, 72(%rax)
	movq %rax, %rdi
	movq %rdi, -8(%rbp)
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
	pushq %rdi
	movq $0, %rdi
	call P_alloc_list
	movq %rax, %rdi
	pushq %rdi
	movq $C_None, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $S_2, %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $8, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	popq %rdi
	movq %rdi, 40(%rax)
	popq %rdi
	movq %rdi, 48(%rax)
	popq %rdi
	movq %rdi, 56(%rax)
	popq %rdi
	movq %rdi, 64(%rax)
	popq %rdi
	movq %rdi, 72(%rax)
	movq %rax, %rdi
	movq %rdi, -16(%rbp)
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -24(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -32(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -40(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -48(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -56(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -64(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -72(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -80(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -88(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -96(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -104(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -112(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -120(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -128(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -136(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -144(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -152(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -160(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -168(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -176(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -184(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -192(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -200(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -208(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -216(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -224(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -232(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -240(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -248(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -256(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -264(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -272(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -280(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -288(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -296(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -304(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -312(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -320(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -328(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -336(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -344(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -352(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -360(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -368(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -376(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -384(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -392(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -400(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -408(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -416(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -424(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -432(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -440(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -448(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -456(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -464(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -472(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -480(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -488(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -496(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -504(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -512(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -520(%rbp)
	movq -8(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	pushq %rdi
	movq -16(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	movq %rdi, -528(%rbp)
	movq -528(%rbp), %rdi
	pushq %rdi
	movq -520(%rbp), %rdi
	pushq %rdi
	movq -512(%rbp), %rdi
	pushq %rdi
	movq -504(%rbp), %rdi
	pushq %rdi
	movq -496(%rbp), %rdi
	pushq %rdi
	movq -488(%rbp), %rdi
	pushq %rdi
	movq -480(%rbp), %rdi
	pushq %rdi
	movq -472(%rbp), %rdi
	pushq %rdi
	movq -464(%rbp), %rdi
	pushq %rdi
	movq -456(%rbp), %rdi
	pushq %rdi
	movq -448(%rbp), %rdi
	pushq %rdi
	movq -440(%rbp), %rdi
	pushq %rdi
	movq -432(%rbp), %rdi
	pushq %rdi
	movq -424(%rbp), %rdi
	pushq %rdi
	movq -416(%rbp), %rdi
	pushq %rdi
	movq -408(%rbp), %rdi
	pushq %rdi
	movq -400(%rbp), %rdi
	pushq %rdi
	movq -392(%rbp), %rdi
	pushq %rdi
	movq -384(%rbp), %rdi
	pushq %rdi
	movq -376(%rbp), %rdi
	pushq %rdi
	movq -368(%rbp), %rdi
	pushq %rdi
	movq -360(%rbp), %rdi
	pushq %rdi
	movq -352(%rbp), %rdi
	pushq %rdi
	movq -344(%rbp), %rdi
	pushq %rdi
	movq -336(%rbp), %rdi
	pushq %rdi
	movq -328(%rbp), %rdi
	pushq %rdi
	movq -320(%rbp), %rdi
	pushq %rdi
	movq -312(%rbp), %rdi
	pushq %rdi
	movq -304(%rbp), %rdi
	pushq %rdi
	movq -296(%rbp), %rdi
	pushq %rdi
	movq -288(%rbp), %rdi
	pushq %rdi
	movq -280(%rbp), %rdi
	pushq %rdi
	movq -272(%rbp), %rdi
	pushq %rdi
	movq -264(%rbp), %rdi
	pushq %rdi
	movq -256(%rbp), %rdi
	pushq %rdi
	movq -248(%rbp), %rdi
	pushq %rdi
	movq -240(%rbp), %rdi
	pushq %rdi
	movq -232(%rbp), %rdi
	pushq %rdi
	movq -224(%rbp), %rdi
	pushq %rdi
	movq -216(%rbp), %rdi
	pushq %rdi
	movq -208(%rbp), %rdi
	pushq %rdi
	movq -200(%rbp), %rdi
	pushq %rdi
	movq -192(%rbp), %rdi
	pushq %rdi
	movq -184(%rbp), %rdi
	pushq %rdi
	movq -176(%rbp), %rdi
	pushq %rdi
	movq -168(%rbp), %rdi
	pushq %rdi
	movq -160(%rbp), %rdi
	pushq %rdi
	movq -152(%rbp), %rdi
	pushq %rdi
	movq -144(%rbp), %rdi
	pushq %rdi
	movq -136(%rbp), %rdi
	pushq %rdi
	movq -128(%rbp), %rdi
	pushq %rdi
	movq -120(%rbp), %rdi
	pushq %rdi
	movq -112(%rbp), %rdi
	pushq %rdi
	movq -104(%rbp), %rdi
	pushq %rdi
	movq -96(%rbp), %rdi
	pushq %rdi
	movq -88(%rbp), %rdi
	pushq %rdi
	movq -80(%rbp), %rdi
	pushq %rdi
	movq -72(%rbp), %rdi
	pushq %rdi
	movq -64(%rbp), %rdi
	pushq %rdi
	movq -56(%rbp), %rdi
	pushq %rdi
	movq -48(%rbp), %rdi
	pushq %rdi
	movq -40(%rbp), %rdi
	pushq %rdi
	movq -32(%rbp), %rdi
	pushq %rdi
	movq -24(%rbp), %rdi
	pushq %rdi
	movq $64, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	popq %rdi
	movq %rdi, 40(%rax)
	popq %rdi
	movq %rdi, 48(%rax)
	popq %rdi
	movq %rdi, 56(%rax)
	popq %rdi
	movq %rdi, 64(%rax)
	popq %rdi
	movq %rdi, 72(%rax)
	popq %rdi
	movq %rdi, 80(%rax)
	popq %rdi
	movq %rdi, 88(%rax)
	popq %rdi
	movq %rdi, 96(%rax)
	popq %rdi
	movq %rdi, 104(%rax)
	popq %rdi
	movq %rdi, 112(%rax)
	popq %rdi
	movq %rdi, 120(%rax)
	popq %rdi
	movq %rdi, 128(%rax)
	popq %rdi
	movq %rdi, 136(%rax)
	popq %rdi
	movq %rdi, 144(%rax)
	popq %rdi
	movq %rdi, 152(%rax)
	popq %rdi
	movq %rdi, 160(%rax)
	popq %rdi
	movq %rdi, 168(%rax)
	popq %rdi
	movq %rdi, 176(%rax)
	popq %rdi
	movq %rdi, 184(%rax)
	popq %rdi
	movq %rdi, 192(%rax)
	popq %rdi
	movq %rdi, 200(%rax)
	popq %rdi
	movq %rdi, 208(%rax)
	popq %rdi
	movq %rdi, 216(%rax)
	popq %rdi
	movq %rdi, 224(%rax)
	popq %rdi
	movq %rdi, 232(%rax)
	popq %rdi
	movq %rdi, 240(%rax)
	popq %rdi
	movq %rdi, 248(%rax)
	popq %rdi
	movq %rdi, 256(%rax)
	popq %rdi
	movq %rdi, 264(%rax)
	popq %rdi
	movq %rdi, 272(%rax)
	popq %rdi
	movq %rdi, 280(%rax)
	popq %rdi
	movq %rdi, 288(%rax)
	popq %rdi
	movq %rdi, 296(%rax)
	popq %rdi
	movq %rdi, 304(%rax)
	popq %rdi
	movq %rdi, 312(%rax)
	popq %rdi
	movq %rdi, 320(%rax)
	popq %rdi
	movq %rdi, 328(%rax)
	popq %rdi
	movq %rdi, 336(%rax)
	popq %rdi
	movq %rdi, 344(%rax)
	popq %rdi
	movq %rdi, 352(%rax)
	popq %rdi
	movq %rdi, 360(%rax)
	popq %rdi
	movq %rdi, 368(%rax)
	popq %rdi
	movq %rdi, 376(%rax)
	popq %rdi
	movq %rdi, 384(%rax)
	popq %rdi
	movq %rdi, 392(%rax)
	popq %rdi
	movq %rdi, 400(%rax)
	popq %rdi
	movq %rdi, 408(%rax)
	popq %rdi
	movq %rdi, 416(%rax)
	popq %rdi
	movq %rdi, 424(%rax)
	popq %rdi
	movq %rdi, 432(%rax)
	popq %rdi
	movq %rdi, 440(%rax)
	popq %rdi
	movq %rdi, 448(%rax)
	popq %rdi
	movq %rdi, 456(%rax)
	popq %rdi
	movq %rdi, 464(%rax)
	popq %rdi
	movq %rdi, 472(%rax)
	popq %rdi
	movq %rdi, 480(%rax)
	popq %rdi
	movq %rdi, 488(%rax)
	popq %rdi
	movq %rdi, 496(%rax)
	popq %rdi
	movq %rdi, 504(%rax)
	popq %rdi
	movq %rdi, 512(%rax)
	popq %rdi
	movq %rdi, 520(%rax)
	movq %rax, %rdi
	movq %rdi, -536(%rbp)
	movq -536(%rbp), %rdi
	call P_print
	call P_print_newline
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_False, %rdi
	pushq %rdi
	movq $C_True, %rdi
	pushq %rdi
	movq $64, %rdi
	call P_alloc_list
	popq %rdi
	movq %rdi, 16(%rax)
	popq %rdi
	movq %rdi, 24(%rax)
	popq %rdi
	movq %rdi, 32(%rax)
	popq %rdi
	movq %rdi, 40(%rax)
	popq %rdi
	movq %rdi, 48(%rax)
	popq %rdi
	movq %rdi, 56(%rax)
	popq %rdi
	movq %rdi, 64(%rax)
	popq %rdi
	movq %rdi, 72(%rax)
	popq %rdi
	movq %rdi, 80(%rax)
	popq %rdi
	movq %rdi, 88(%rax)
	popq %rdi
	movq %rdi, 96(%rax)
	popq %rdi
	movq %rdi, 104(%rax)
	popq %rdi
	movq %rdi, 112(%rax)
	popq %rdi
	movq %rdi, 120(%rax)
	popq %rdi
	movq %rdi, 128(%rax)
	popq %rdi
	movq %rdi, 136(%rax)
	popq %rdi
	movq %rdi, 144(%rax)
	popq %rdi
	movq %rdi, 152(%rax)
	popq %rdi
	movq %rdi, 160(%rax)
	popq %rdi
	movq %rdi, 168(%rax)
	popq %rdi
	movq %rdi, 176(%rax)
	popq %rdi
	movq %rdi, 184(%rax)
	popq %rdi
	movq %rdi, 192(%rax)
	popq %rdi
	movq %rdi, 200(%rax)
	popq %rdi
	movq %rdi, 208(%rax)
	popq %rdi
	movq %rdi, 216(%rax)
	popq %rdi
	movq %rdi, 224(%rax)
	popq %rdi
	movq %rdi, 232(%rax)
	popq %rdi
	movq %rdi, 240(%rax)
	popq %rdi
	movq %rdi, 248(%rax)
	popq %rdi
	movq %rdi, 256(%rax)
	popq %rdi
	movq %rdi, 264(%rax)
	popq %rdi
	movq %rdi, 272(%rax)
	popq %rdi
	movq %rdi, 280(%rax)
	popq %rdi
	movq %rdi, 288(%rax)
	popq %rdi
	movq %rdi, 296(%rax)
	popq %rdi
	movq %rdi, 304(%rax)
	popq %rdi
	movq %rdi, 312(%rax)
	popq %rdi
	movq %rdi, 320(%rax)
	popq %rdi
	movq %rdi, 328(%rax)
	popq %rdi
	movq %rdi, 336(%rax)
	popq %rdi
	movq %rdi, 344(%rax)
	popq %rdi
	movq %rdi, 352(%rax)
	popq %rdi
	movq %rdi, 360(%rax)
	popq %rdi
	movq %rdi, 368(%rax)
	popq %rdi
	movq %rdi, 376(%rax)
	popq %rdi
	movq %rdi, 384(%rax)
	popq %rdi
	movq %rdi, 392(%rax)
	popq %rdi
	movq %rdi, 400(%rax)
	popq %rdi
	movq %rdi, 408(%rax)
	popq %rdi
	movq %rdi, 416(%rax)
	popq %rdi
	movq %rdi, 424(%rax)
	popq %rdi
	movq %rdi, 432(%rax)
	popq %rdi
	movq %rdi, 440(%rax)
	popq %rdi
	movq %rdi, 448(%rax)
	popq %rdi
	movq %rdi, 456(%rax)
	popq %rdi
	movq %rdi, 464(%rax)
	popq %rdi
	movq %rdi, 472(%rax)
	popq %rdi
	movq %rdi, 480(%rax)
	popq %rdi
	movq %rdi, 488(%rax)
	popq %rdi
	movq %rdi, 496(%rax)
	popq %rdi
	movq %rdi, 504(%rax)
	popq %rdi
	movq %rdi, 512(%rax)
	popq %rdi
	movq %rdi, 520(%rax)
	movq %rax, %rdi
	movq %rdi, -544(%rbp)
	movq -24(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $0, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -32(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $1, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -40(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $2, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -48(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $3, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -56(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $4, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -64(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $5, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -72(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $6, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -80(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $7, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -88(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $8, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -96(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $9, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -104(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $10, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -112(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $11, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -120(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $12, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -128(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $13, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -136(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $14, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -144(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $15, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -152(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $16, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -160(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $17, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -168(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $18, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -176(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $19, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -184(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $20, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -192(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $21, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -200(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $22, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -208(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $23, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -216(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $24, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -224(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $25, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -232(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $26, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -240(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $27, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -248(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $28, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -256(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $29, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -264(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $30, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -272(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $31, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -280(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $32, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -288(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $33, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -296(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $34, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -304(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $35, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -312(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $36, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -320(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $37, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -328(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $38, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -336(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $39, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -344(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $40, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -352(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $41, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -360(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $42, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -368(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $43, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -376(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $44, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -384(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $45, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -392(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $46, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -400(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $47, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -408(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $48, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -416(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $49, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -424(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $50, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -432(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $51, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -440(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $52, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -448(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $53, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -456(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $54, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -464(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $55, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -472(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $56, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -480(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $57, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -488(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $58, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -496(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $59, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -504(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $60, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -512(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $61, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -520(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $62, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
	call P_print
	call P_print_newline
	movq -528(%rbp), %rdi
	pushq %rdi
	movq -544(%rbp), %rdi
	pushq %rdi
	movq $63, %rdi
	call P_alloc_int
	movq %rax, %rdi
	movq %rdi, %rsi
	movq 8(%rsi), %rsi
	popq %rdi
	cmpq $0, %rsi
	jl index_out_of_bounds
	movq 8(%rdi), %rcx
	cmpq %rcx, %rsi
	jge index_out_of_bounds
	movq 16(%rdi,%rsi,8), %rdi
	movq %rdi, %rsi
	popq %rdi
	call P_equal
	testq %rax, %rax
	sete %al
	movq $C_True, %rdi
	movq $C_False, %rsi
	testb %al, %al
	cmovz %rsi, %rdi
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
S_2:
	.quad 3, 1
	.string "1"
S_1:
	.quad 3, 1
	.string "1"
