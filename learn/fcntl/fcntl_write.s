	.file	"fcntl_write.c"
	.section	.rodata
.LC0:
	.string	"read lock set by %d\n"
.LC1:
	.string	"write lock set by %d\n"
.LC2:
	.string	"release lock by %d\n"
.LC3:
	.string	"read lock already set by %d\n"
.LC4:
	.string	"write lock already set by %d\n"
	.text
	.globl	lock_set
	.type	lock_set, @function
lock_set:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -46(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
.L10:
	movl	-56(%rbp), %eax
	movw	%ax, -48(%rbp)
	leaq	-48(%rbp), %rdx
	movl	-52(%rbp), %eax
	movl	$6, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl
	testl	%eax, %eax
	jne	.L2
	movzwl	-48(%rbp), %eax
	testw	%ax, %ax
	jne	.L3
	call	getpid
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	jmp	.L13
.L3:
	movzwl	-48(%rbp), %eax
	cmpw	$1, %ax
	jne	.L5
	call	getpid
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	jmp	.L13
.L5:
	movzwl	-48(%rbp), %eax
	cmpw	$2, %ax
	jne	.L13
	call	getpid
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L13
.L2:
	leaq	-48(%rbp), %rdx
	movl	-52(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	fcntl
	movzwl	-48(%rbp), %eax
	cmpw	$2, %ax
	je	.L10
	movzwl	-48(%rbp), %eax
	testw	%ax, %ax
	jne	.L8
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	jmp	.L9
.L8:
	movzwl	-48(%rbp), %eax
	cmpw	$1, %ax
	jne	.L9
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L9:
	call	getchar
	jmp	.L10
.L13:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L12
	call	__stack_chk_fail
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	lock_set, .-lock_set
	.section	.rodata
.LC5:
	.string	"hello"
.LC6:
	.string	"open"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$438, %edx
	movl	$66, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L15
	movl	$.LC6, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L15:
	movl	-4(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	lock_set
	call	getchar
	movl	-4(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	lock_set
	call	getchar
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
