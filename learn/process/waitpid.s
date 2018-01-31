	.file	"waitpid.c"
	.section	.rodata
.LC0:
	.string	"Error fork."
	.align 8
.LC1:
	.string	"The child process has not exited"
.LC2:
	.string	"Get child %d\n"
.LC3:
	.string	"some error occured."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	fork
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jns	.L2
	movl	$.LC0, %edi
	call	puts
	jmp	.L3
.L2:
	cmpl	$0, -8(%rbp)
	jne	.L4
	movl	$5, %edi
	call	sleep
	movl	$0, %edi
	call	exit
.L4:
	movl	$0, %eax
	movq	%rax, %rdi
	call	wait
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L5
	movl	$.LC1, %edi
	call	puts
	movl	$1, %edi
	call	sleep
.L5:
	cmpl	$0, -4(%rbp)
	je	.L4
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L6
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L3
.L6:
	movl	$.LC3, %edi
	call	puts
.L3:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
