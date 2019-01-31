	.file	1 "ass2_1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8	; $sp=$sp+(-8) ; sp = stack pointer ; addiu - add immediate unsigned int
	sw	$fp,4($sp)	; transfer $fp in memory at position($sp+4) ; $fp = frame pointer
	move	$fp,$sp		; $fp = $sp
	nop			; This instruction will take up all 5 stages of pipeline
	move	$sp,$fp		; $sp = $fp
	lw	$fp,4($sp)	; load $fp from Memory from location($sp+4)
	addiu	$sp,$sp,8	
	j	$31		;jump to address $31
	nop			; no side effects

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
