	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_func
	.align	4, 0x90
_func:                                  ## @func
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$1056, %rsp             ## imm = 0x420
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, -8(%rbp)
	movl	%edi, -1044(%rbp)
	movl	%esi, -1048(%rbp)
	movl	-1044(%rbp), %esi
	addl	-1048(%rbp), %esi
	movl	%esi, -1052(%rbp)
	movl	-1052(%rbp), %esi
	movq	(%rax), %rax
	cmpq	-8(%rbp), %rax
	movl	%esi, -1056(%rbp)       ## 4-byte Spill
	jne	LBB0_2
## BB#1:                                ## %SP_return
	movl	-1056(%rbp), %eax       ## 4-byte Reload
	addq	$1056, %rsp             ## imm = 0x420
	popq	%rbp
	retq
LBB0_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$1, %edi
	movl	$2, %esi
	movl	$0, -4(%rbp)
	callq	_func
	xorl	%esi, %esi
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	movl	%esi, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
