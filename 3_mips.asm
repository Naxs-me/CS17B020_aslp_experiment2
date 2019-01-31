	.file	1 "ass2_3.c"
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
	.frame	$fp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
	.mask	0x40030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16				; $sp=$sp+(-16) ; sp = stack pointer ; addiu - add immediate unsigned int
	sw	$fp,12($sp)				; store $fp in memory location($sp+12)
	sw	$17,8($sp)
	sw	$16,4($sp)
	move	$fp,$sp					; $fp = $sp
	li	$16,3			# 0x3		; $16 = 3
	b	$L2					; branch unconditionally to $l2
	nop						; no side effects

$L8:
	li	$17,2			# 0x2		
	b	$L3
	nop

$L6:
	teq	$17,$0,7				; trap if equal ; if $17 == $0 then trap 7
	div	$0,$16,$17				; $0 = $16/$17
	mfhi	$2					; $2 = hi(general purpose register
	bne	$2,$0,$L4				; if $2!=$0 then branch to $L4
	nop

	b	$L10
	nop

$L4:
	addiu	$17,$17,1
$L3:
	slt	$2,$17,$16				; if $17<$16 $2 = 1 else $2 = 0
	bne	$2,$0,$L6				
	nop

$L10:
	addiu	$16,$16,1
$L2:
	slt	$2,$16,100
	bne	$2,$0,$L8g
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$fp,12($sp)				; load $fp in memory location ($sp + 12)
	lw	$17,8($sp)
	lw	$16,4($sp)
	addiu	$sp,$sp,16
	j	$31					; jump to $31 ; termination-
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
