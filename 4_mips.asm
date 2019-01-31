	.file	1 "ass2_4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0xc0070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48				; $sp=$sp-48
	sw	$31,44($sp)				; store $31 in memory address ($sp+44)
	sw	$fp,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	move	$fp,$sp					; $fp = $sp
	lui	$28,%hi(__gnu_local_gp)			; load %hi in upper 16 bits of $28
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	li	$31,45			# 0x2d		; $31=45
	move	$18,$0
	move	$17,$0
	li	$17,1			# 0x1
	move	$17,$0
	li	$16,2			# 0x2
	b	$L2					; branch unconditionally to $L2 
	nop						; no operation

$L5:
	teq	$16,$0,7				; if $16==$0 then trap 7
	div	$0,$31,$16				; $0=$31/$16
	mfhi	$2					; $2<-hi ; move from HI
	bne	$2,$0,$L3
	nop

	li	$17,1			# 0x1
	b	$L4
	nop

$L3:
	addiu	$16,$16,1
$L2:
	slt	$2,$16,$31				; if $16<$31 $2 = 1 else $2 = 0
	bne	$2,$0,$L5				; if $2!=$0 then jump to $L5
	nop

$L4:
	move	$2,$31
	andi	$2,$2,0x1				; $2=$2 and 0x1
	bne	$2,$0,$L6
	nop

	li	$17,2			# 0x2
$L6:
	li	$16,2			# 0x2
	li	$2,1			# 0x1
	beq	$17,$2,$L11				; if $17 == $2 jump to $L11
	nop

	li	$2,2			# 0x2
	beq	$17,$2,$L9
	nop

	beq	$17,$0,$L10
	nop

	b	$L7
	nop

$L16:
	addiu	$31,$31,1
	move	$17,$0
	b	$L12
	nop

$L15:
	teq	$16,$0,7
	div	$0,$31,$16
	mfhi	$2
	bne	$2,$0,$L13
	nop

	li	$17,1			# 0x1
	b	$L14
	nop

$L13:
	addiu	$16,$16,1
$L12:
	slt	$2,$16,$31
	bne	$2,$0,$L15
	nop

$L14:
	bne	$17,$0,$L11
	nop

	li	$18,1			# 0x1
$L11:
	beq	$18,$0,$L16
	nop

	b	$L7
	nop

$L10:
	addiu	$31,$31,1
	b	$L7
	nop

$L9:
	addiu	$31,$31,1
	nop
$L7:
	move	$5,$31
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	addiu	$sp,$sp,48
	j	$31				; jump to $31 ; termination
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
