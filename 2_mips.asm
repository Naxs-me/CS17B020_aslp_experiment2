	.file	1 "ass2_2.c"
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
	.frame	$fp,64,$31		# vars= 24, regs= 4/0, args= 16, gp= 8
	.mask	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64				; $sp=$sp+(-64) ; sp = stack pointer ; addiu - add immediate unsigned int
	sw	$31,60($sp)				; transfer $31 in memory at position($sp+60) ; $fp = frame pointer
	sw	$fp,56($sp)				
	sw	$17,52($sp)
	sw	$16,48($sp)
	move	$fp,$sp					; $fp = $sp
	lui	$28,%hi(__gnu_local_gp)			; lui: load upper immediate ; load %hi into upper half of $28 ; upper half = upper 16 bits
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)		; load $2 from Memory from location($28 + %got)
	lw	$2,0($2)				
	sw	$2,44($fp)
	li	$17,5			# 0x5		; load 5 in $17
	li	$2,1			# 0x1
	sw	$2,24($fp)
	li	$2,2			# 0x2
	sw	$2,28($fp)
	li	$2,3			# 0x3
	sw	$2,32($fp)
	li	$2,4			# 0x4
	sw	$2,36($fp)
	li	$2,5			# 0x5
	sw	$2,40($fp)
	move	$16,$0					; $16 = $0
	b	$L2					; b - branch ; jump unconditionally to $L2
	nop						; fills the pipeline

$L3:
	sll	$2,$16,2				;$2 = logical left shift $16 by 2 ($2=$16<<2)
	addiu	$3,$fp,48
	addu	$2,$3,$2				;$2 = $3+$2
	lw	$2,-24($2)
	addu	$3,$2,$17
	sll	$2,$16,2
	addiu	$4,$fp,48
	addu	$2,$4,$2
	sw	$3,-24($2)
	addiu	$16,$16,1
$L2:
	slt	$2,$16,5				; $2=1 if $16<5 else %2 = 0
	bne	$2,$0,$L3				; bne = branch if not equal ; if $2!=$0 goto $L3
	nop

	move	$2,$0					
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,44($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5				; if $4==$3 goto $L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25					; jump and link to $25
	nop

$L5:
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	lw	$17,52($sp)
	lw	$16,48($sp)
	addiu	$sp,$sp,64
	j	$31					; jump to $31 ; termination
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
