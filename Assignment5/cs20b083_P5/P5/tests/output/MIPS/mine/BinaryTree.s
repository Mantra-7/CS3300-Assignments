
	.text
	.globl main
main:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 48
		li $v1, 4
		move $s0, $v1
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $v1, 4
		move $s1, $v1
		move $a0, $s1
		jal _halloc
		move $s1, $v0
		move $s1, $s1
		la $s2, BT_Start
		sw $s2, 0($s0)
		sw $s0, 0($s1)
		move $s1, $s1
		lw $s0, 0($s1)
		lw $s0, 0($s0)
		sw $t0, -8($fp)
		sw $t1, -12($fp)
		sw $t2, -16($fp)
		sw $t3, -20($fp)
		sw $t4, -24($fp)
		sw $t5, -28($fp)
		sw $t6, -32($fp)
		sw $t7, -36($fp)
		sw $t8, -40($fp)
		sw $t9, -44($fp)
		move $a0, $s1
		move $v0, $s0
		jalr $v0
		lw $t0, -8($fp)
		lw $t1, -12($fp)
		lw $t2, -16($fp)
		lw $t3, -20($fp)
		lw $t4, -24($fp)
		lw $t5, -28($fp)
		lw $t6, -32($fp)
		lw $t7, -36($fp)
		lw $t8, -40($fp)
		lw $t9, -44($fp)
		move $s0, $v0
		move $a0, $s0
		jal _print
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 48
		j $ra

	.text
	.globl BT_Start
BT_Start:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $v1, $a0
		li $v1, 80
		move $s0, $v1
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $v1, 28
		move $s1, $v1
		move $a0, $s1
		jal _halloc
		move $s1, $v0
		move $s1, $s1
		la $s2, Tree_RecPrint
		sw $s2, 76($s0)
		la $s2, Tree_Print
		sw $s2, 72($s0)
		la $s2, Tree_Search
		sw $s2, 68($s0)
		la $s2, Tree_RemoveLeft
		sw $s2, 64($s0)
		la $s2, Tree_RemoveRight
		sw $s2, 60($s0)
		la $s2, Tree_Remove
		sw $s2, 56($s0)
		la $s2, Tree_Delete
		sw $s2, 52($s0)
		la $s2, Tree_Insert
		sw $s2, 48($s0)
		la $s2, Tree_Compare
		sw $s2, 44($s0)
		la $s2, Tree_SetHas_Right
		sw $s2, 40($s0)
		la $s2, Tree_SetHas_Left
		sw $s2, 36($s0)
		la $s2, Tree_GetHas_Left
		sw $s2, 32($s0)
		la $s2, Tree_GetHas_Right
		sw $s2, 28($s0)
		la $s2, Tree_SetKey
		sw $s2, 24($s0)
		la $s2, Tree_GetKey
		sw $s2, 20($s0)
		la $s2, Tree_GetLeft
		sw $s2, 16($s0)
		la $s2, Tree_GetRight
		sw $s2, 12($s0)
		la $s2, Tree_SetLeft
		sw $s2, 8($s0)
		la $s2, Tree_SetRight
		sw $s2, 4($s0)
		la $s2, Tree_Init
		sw $s2, 0($s0)
		li $v1, 4
		move $s2, $v1
		move $s2, $s2
L2:
		li $v1, 27
		move $s3, $v1
		sle $s3, $s2, $s3
		beqz $s3, L3
		add $s3, $s1, $s2
		li $v1, 0
		move $s4, $v1
		sw $s4, 0($s3)
		li $v1, 4
		move $s4, $v1
		add $s4, $s2, $s4
		move $s2, $s4
		b L2
L3:
		sw $s0, 0($s1)
		move $s1, $s1
		move $s2, $s1
		lw $s0, 0($s2)
		lw $s0, 0($s0)
		li $v1, 16
		move $s4, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s4
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s1
		lw $s0, 0($s4)
		lw $s0, 72($s0)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $v1, $s0
		li $v1, 100000000
		move $s0, $v1
		move $a0, $s0
		jal _print
		move $s0, $s1
		lw $s4, 0($s0)
		lw $s4, 48($s4)
		li $v1, 8
		move $s2, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		move $s2, $s1
		lw $s4, 0($s2)
		lw $s4, 72($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s1
		lw $s2, 0($s4)
		lw $s2, 48($s2)
		li $v1, 24
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s0
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $v1, $s0
		move $s0, $s1
		lw $s2, 0($s0)
		lw $s2, 48($s2)
		li $v1, 4
		move $s4, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s4
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s1
		lw $s2, 0($s4)
		lw $s2, 48($s2)
		li $v1, 12
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s0
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $v1, $s0
		move $s0, $s1
		lw $s2, 0($s0)
		lw $s2, 48($s2)
		li $v1, 20
		move $s4, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s4
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s1
		lw $s2, 0($s4)
		lw $s2, 48($s2)
		li $v1, 28
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s0
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $v1, $s0
		move $s0, $s1
		lw $s2, 0($s0)
		lw $s2, 48($s2)
		li $v1, 14
		move $s4, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s4
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s1
		lw $s2, 0($s4)
		lw $s2, 72($s2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		move $s2, $s1
		lw $s4, 0($s2)
		lw $s4, 68($s4)
		li $v1, 24
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s0
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $a0, $s0
		jal _print
		move $s0, $s1
		lw $s4, 0($s0)
		lw $s4, 68($s4)
		li $v1, 12
		move $s2, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $a0, $s2
		jal _print
		move $s2, $s1
		lw $s4, 0($s2)
		lw $s4, 68($s4)
		li $v1, 16
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s0
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $a0, $s0
		jal _print
		move $s0, $s1
		lw $s4, 0($s0)
		lw $s4, 68($s4)
		li $v1, 50
		move $s2, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $a0, $s2
		jal _print
		move $s2, $s1
		lw $s4, 0($s2)
		lw $s4, 68($s4)
		li $v1, 12
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s0
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $a0, $s0
		jal _print
		move $s0, $s1
		lw $s4, 0($s0)
		lw $s4, 52($s4)
		li $v1, 12
		move $s2, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		move $s2, $s1
		lw $s4, 0($s2)
		lw $s4, 72($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s1, $s1
		lw $s4, 0($s1)
		lw $s4, 68($s4)
		li $v1, 12
		move $s2, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s1
		move $a1, $s2
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $v1, 0
		move $s2, $v1
		move $v0, $s2
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_Init
Tree_Init:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s1, $a0
		move $s0, $a1
		sw $s0, 12($s1)
		li $v1, 0
		move $s0, $v1
		sw $s0, 16($s1)
		li $v1, 0
		move $s0, $v1
		sw $s0, 20($s1)
		li $v1, 1
		move $s0, $v1
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_SetRight
Tree_SetRight:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		sw $s1, 8($s0)
		li $v1, 1
		move $s1, $v1
		move $v0, $s1
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_SetLeft
Tree_SetLeft:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		sw $s1, 4($s0)
		li $v1, 1
		move $s1, $v1
		move $v0, $s1
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_GetRight
Tree_GetRight:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		lw $s0, 8($s0)
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_GetLeft
Tree_GetLeft:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		lw $s0, 4($s0)
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_GetKey
Tree_GetKey:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		lw $s0, 12($s0)
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_SetKey
Tree_SetKey:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		sw $s1, 12($s0)
		li $v1, 1
		move $s1, $v1
		move $v0, $s1
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		lw $s0, 20($s0)
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		lw $s0, 16($s0)
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		sw $s1, 16($s0)
		li $v1, 1
		move $s1, $v1
		move $v0, $s1
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		sw $s1, 20($s0)
		li $v1, 1
		move $s1, $v1
		move $v0, $s1
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_Compare
Tree_Compare:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $v1, $a0
		move $s1, $a1
		move $s0, $a2
		li $v1, 0
		move $s2, $v1
		move $v1, $s2
		li $v1, 1
		move $s2, $v1
		add $s2, $s0, $s2
		move $s2, $s2
		li $v1, 1
		move $s3, $v1
		sub $s3, $s0, $s3
		move $s3, $s3
		sle $s3, $s1, $s3
		beqz $s3, L4
		li $v1, 0
		move $s3, $v1
		move $s3, $s3
		b L5
L4:
		li $v1, 1
		move $s0, $v1
		sub $s0, $s2, $s0
		move $s0, $s0
		li $v1, 1
		move $s2, $v1
		sle $s0, $s1, $s0
		sub $s0, $s2, $s0
		beqz $s0, L6
		li $v1, 0
		move $s0, $v1
		move $s3, $s0
		b L7
L6:
		li $v1, 1
		move $s0, $v1
		move $s3, $s0
L7:
L5:
		move $v0, $s3
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl Tree_Insert
Tree_Insert:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		li $v1, 80
		move $s2, $v1
		move $a0, $s2
		jal _halloc
		move $s2, $v0
		move $s2, $s2
		li $v1, 28
		move $s3, $v1
		move $a0, $s3
		jal _halloc
		move $s3, $v0
		move $s3, $s3
		la $s4, Tree_RecPrint
		sw $s4, 76($s2)
		la $s4, Tree_Print
		sw $s4, 72($s2)
		la $s4, Tree_Search
		sw $s4, 68($s2)
		la $s4, Tree_RemoveLeft
		sw $s4, 64($s2)
		la $s4, Tree_RemoveRight
		sw $s4, 60($s2)
		la $s4, Tree_Remove
		sw $s4, 56($s2)
		la $s4, Tree_Delete
		sw $s4, 52($s2)
		la $s4, Tree_Insert
		sw $s4, 48($s2)
		la $s4, Tree_Compare
		sw $s4, 44($s2)
		la $s4, Tree_SetHas_Right
		sw $s4, 40($s2)
		la $s4, Tree_SetHas_Left
		sw $s4, 36($s2)
		la $s4, Tree_GetHas_Left
		sw $s4, 32($s2)
		la $s4, Tree_GetHas_Right
		sw $s4, 28($s2)
		la $s4, Tree_SetKey
		sw $s4, 24($s2)
		la $s4, Tree_GetKey
		sw $s4, 20($s2)
		la $s4, Tree_GetLeft
		sw $s4, 16($s2)
		la $s4, Tree_GetRight
		sw $s4, 12($s2)
		la $s4, Tree_SetLeft
		sw $s4, 8($s2)
		la $s4, Tree_SetRight
		sw $s4, 4($s2)
		la $s4, Tree_Init
		sw $s4, 0($s2)
		li $v1, 4
		move $s4, $v1
		move $s4, $s4
L8:
		li $v1, 27
		move $s5, $v1
		sle $s5, $s4, $s5
		beqz $s5, L9
		add $s5, $s3, $s4
		li $v1, 0
		move $s6, $v1
		sw $s6, 0($s5)
		li $v1, 4
		move $s6, $v1
		add $s6, $s4, $s6
		move $s4, $s6
		b L8
L9:
		sw $s2, 0($s3)
		move $s3, $s3
		move $s4, $s3
		lw $s2, 0($s4)
		lw $s2, 0($s2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s1
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		move $s0, $s0
		li $v1, 1
		move $s2, $v1
		move $s2, $s2
L10:
		beqz $s2, L11
		move $s4, $s0
		lw $s6, 0($s4)
		lw $s6, 20($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		move $s6, $s6
		li $v1, 1
		move $s4, $v1
		sub $s4, $s6, $s4
		move $s4, $s4
		sle $s4, $s1, $s4
		beqz $s4, L12
		move $s4, $s0
		lw $s6, 0($s4)
		lw $s6, 32($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		beqz $s6, L14
		move $s6, $s0
		lw $s4, 0($s6)
		lw $s4, 16($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $s0, $s4
		b L15
L14:
		li $v1, 0
		move $s4, $v1
		move $s2, $s4
		move $s4, $s0
		lw $s6, 0($s4)
		lw $s6, 36($s6)
		li $v1, 1
		move $s5, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s5
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
		move $s5, $s0
		lw $s6, 0($s5)
		lw $s6, 8($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $a1, $s3
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		move $v1, $s6
L15:
		b L13
L12:
		move $s6, $s0
		lw $s5, 0($s6)
		lw $s5, 28($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		beqz $s5, L16
		move $s5, $s0
		lw $s6, 0($s5)
		lw $s6, 12($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		move $s0, $s6
		b L17
L16:
		li $v1, 0
		move $s6, $v1
		move $s2, $s6
		move $s6, $s0
		lw $s5, 0($s6)
		lw $s5, 40($s5)
		li $v1, 1
		move $s4, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $a1, $s4
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $v1, $s4
		move $s4, $s0
		lw $s5, 0($s4)
		lw $s5, 4($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s3
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
L17:
L13:
		b L10
L11:
		li $v1, 1
		move $s2, $v1
		move $v0, $s2
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_Delete
Tree_Delete:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $s0
		move $s3, $s0
		li $v1, 1
		move $s4, $v1
		move $s4, $s4
		li $v1, 0
		move $s5, $v1
		move $s5, $s5
		li $v1, 1
		move $s6, $v1
		move $s6, $s6
L18:
		beqz $s4, L19
		move $s7, $s2
		lw $t0, 0($s7)
		lw $t0, 20($t0)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s7
		move $v0, $t0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t0, $v0
		move $t0, $t0
		li $v1, 1
		move $s7, $v1
		sub $s7, $t0, $s7
		move $s7, $s7
		sle $s7, $s1, $s7
		beqz $s7, L20
		move $s7, $s2
		lw $t1, 0($s7)
		lw $t1, 32($t1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s7
		move $v0, $t1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t1, $v0
		beqz $t1, L22
		move $s3, $s2
		move $t1, $s2
		lw $s7, 0($t1)
		lw $s7, 16($s7)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $t1
		move $v0, $s7
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s7, $v0
		move $s2, $s7
		b L23
L22:
		li $v1, 0
		move $s7, $v1
		move $s4, $s7
L23:
		b L21
L20:
		li $v1, 1
		move $s7, $v1
		sub $s7, $s1, $s7
		move $s7, $s7
		sle $s7, $t0, $s7
		beqz $s7, L24
		move $s7, $s2
		lw $t0, 0($s7)
		lw $t0, 28($t0)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s7
		move $v0, $t0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t0, $v0
		beqz $t0, L26
		move $s3, $s2
		move $t0, $s2
		lw $s7, 0($t0)
		lw $s7, 12($s7)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $t0
		move $v0, $s7
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s7, $v0
		move $s2, $s7
		b L27
L26:
		li $v1, 0
		move $s7, $v1
		move $s4, $s7
L27:
		b L25
L24:
		beqz $s6, L28
		li $v1, 0
		move $s7, $v1
		move $s7, $s7
		li $v1, 1
		move $t0, $v1
		move $t1, $s2
		lw $t2, 0($t1)
		lw $t2, 28($t2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $t1
		move $v0, $t2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t2, $v0
		sub $t2, $t0, $t2
		beqz $t2, L32
		li $v1, 1
		move $t2, $v1
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t1, 32($t1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $t0
		move $v0, $t1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t1, $v0
		sub $t1, $t2, $t1
		beqz $t1, L32
		li $v1, 1
		move $t1, $v1
		move $s7, $t1
L32:
		beqz $s7, L30
		li $v1, 1
		move $s7, $v1
		move $v1, $s7
		b L31
L30:
		move $s7, $s0
		lw $t1, 0($s7)
		lw $t1, 56($t1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s7
		move $a1, $s3
		move $a2, $s2
		move $v0, $t1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $t1, $v0
		move $v1, $t1
L31:
		b L29
L28:
		move $t1, $s0
		lw $s7, 0($t1)
		lw $s7, 56($s7)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $t1
		move $a1, $s3
		move $a2, $s2
		move $v0, $s7
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s7, $v0
		move $v1, $s7
L29:
		li $v1, 1
		move $s7, $v1
		move $s5, $s7
		li $v1, 0
		move $s7, $v1
		move $s4, $s7
L25:
L21:
		li $v1, 0
		move $s7, $v1
		move $s6, $s7
		b L18
L19:
		move $v0, $s5
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_Remove
Tree_Remove:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s1, $a0
		move $s2, $a1
		move $s0, $a2
		move $s3, $s0
		lw $s4, 0($s3)
		lw $s4, 32($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		beqz $s4, L33
		move $s4, $s1
		lw $s3, 0($s4)
		lw $s3, 64($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s2
		move $a2, $s0
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $v1, $s3
		b L34
L33:
		move $s3, $s0
		lw $s4, 0($s3)
		lw $s4, 28($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		beqz $s4, L35
		move $s4, $s1
		lw $s3, 0($s4)
		lw $s3, 60($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s2
		move $a2, $s0
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $v1, $s3
		b L36
L35:
		move $s3, $s0
		lw $s4, 0($s3)
		lw $s4, 20($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $s4, $s4
		move $s3, $s2
		lw $s0, 0($s3)
		lw $s0, 16($s0)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $s0, $s0
		lw $s3, 0($s0)
		lw $s3, 20($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $s3, $s3
		move $s0, $s1
		lw $s5, 0($s0)
		lw $s5, 44($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s4
		move $a2, $s3
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		beqz $s5, L37
		move $s5, $s2
		lw $s0, 0($s5)
		lw $s0, 8($s0)
		lw $s3, 24($s1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $a1, $s3
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $v1, $s3
		move $s3, $s2
		lw $s0, 0($s3)
		lw $s0, 36($s0)
		li $v1, 0
		move $s5, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $a1, $s5
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
		b L38
L37:
		move $s5, $s2
		lw $s0, 0($s5)
		lw $s0, 4($s0)
		lw $s1, 24($s1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $a1, $s1
		move $v0, $s0
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s1, $v0
		move $v1, $s1
		move $s2, $s2
		lw $s1, 0($s2)
		lw $s1, 40($s1)
		li $v1, 0
		move $s0, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s0
		move $v0, $s1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s0, $v0
		move $v1, $s0
L38:
L36:
L34:
		li $v1, 1
		move $s0, $v1
		move $v0, $s0
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s1, $a0
		move $s2, $a1
		move $s0, $a2
L39:
		move $s3, $s0
		lw $s4, 0($s3)
		lw $s4, 28($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		beqz $s4, L40
		move $s4, $s0
		lw $s3, 0($s4)
		lw $s3, 24($s3)
		move $s5, $s0
		lw $s6, 0($s5)
		lw $s6, 12($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		move $s6, $s6
		lw $s5, 0($s6)
		lw $s5, 20($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s5
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
		move $s2, $s0
		move $s5, $s0
		lw $s3, 0($s5)
		lw $s3, 12($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $s0, $s3
		b L39
L40:
		move $s0, $s2
		lw $s3, 0($s0)
		lw $s3, 4($s3)
		lw $s1, 24($s1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s1
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s1, $v0
		move $v1, $s1
		move $s2, $s2
		lw $s1, 0($s2)
		lw $s1, 40($s1)
		li $v1, 0
		move $s3, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s3
		move $v0, $s1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $v1, $s3
		li $v1, 1
		move $s3, $v1
		move $v0, $s3
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s1, $a0
		move $s2, $a1
		move $s0, $a2
L41:
		move $s3, $s0
		lw $s4, 0($s3)
		lw $s4, 32($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		beqz $s4, L42
		move $s4, $s0
		lw $s3, 0($s4)
		lw $s3, 24($s3)
		move $s5, $s0
		lw $s6, 0($s5)
		lw $s6, 16($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		move $s6, $s6
		lw $s5, 0($s6)
		lw $s5, 20($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $a1, $s5
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
		move $s2, $s0
		move $s5, $s0
		lw $s3, 0($s5)
		lw $s3, 16($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $s0, $s3
		b L41
L42:
		move $s0, $s2
		lw $s3, 0($s0)
		lw $s3, 8($s3)
		lw $s1, 24($s1)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s1
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s1, $v0
		move $v1, $s1
		move $s2, $s2
		lw $s1, 0($s2)
		lw $s1, 36($s1)
		li $v1, 0
		move $s3, $v1
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $a1, $s3
		move $v0, $s1
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		move $v1, $s3
		li $v1, 1
		move $s3, $v1
		move $v0, $s3
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_Search
Tree_Search:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		move $s0, $s0
		li $v1, 1
		move $s2, $v1
		move $s2, $s2
		li $v1, 0
		move $s3, $v1
		move $s3, $s3
L43:
		beqz $s2, L44
		move $s4, $s0
		lw $s5, 0($s4)
		lw $s5, 20($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $s5, $s5
		li $v1, 1
		move $s4, $v1
		sub $s4, $s5, $s4
		move $s4, $s4
		sle $s4, $s1, $s4
		beqz $s4, L45
		move $s4, $s0
		lw $s6, 0($s4)
		lw $s6, 32($s6)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s6
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s6, $v0
		beqz $s6, L47
		move $s6, $s0
		lw $s4, 0($s6)
		lw $s4, 16($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s6
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $s0, $s4
		b L48
L47:
		li $v1, 0
		move $s4, $v1
		move $s2, $s4
L48:
		b L46
L45:
		li $v1, 1
		move $s4, $v1
		sub $s4, $s1, $s4
		move $s4, $s4
		sle $s4, $s5, $s4
		beqz $s4, L49
		move $s4, $s0
		lw $s5, 0($s4)
		lw $s5, 28($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		beqz $s5, L51
		move $s5, $s0
		lw $s4, 0($s5)
		lw $s4, 12($s4)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s4
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s4, $v0
		move $s0, $s4
		b L52
L51:
		li $v1, 0
		move $s4, $v1
		move $s2, $s4
L52:
		b L50
L49:
		li $v1, 1
		move $s4, $v1
		move $s3, $s4
		li $v1, 0
		move $s4, $v1
		move $s2, $s4
L50:
L46:
		b L43
L44:
		move $v0, $s3
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_Print
Tree_Print:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $s0
		move $s0, $s0
		lw $s2, 0($s0)
		lw $s2, 76($s2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s1
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		li $v1, 1
		move $s2, $v1
		move $v0, $s2
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl Tree_RecPrint
Tree_RecPrint:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 80
		sw $s0, -8($fp)
		sw $s1, -12($fp)
		sw $s2, -16($fp)
		sw $s3, -20($fp)
		sw $s4, -24($fp)
		sw $s5, -28($fp)
		sw $s6, -32($fp)
		sw $s7, -36($fp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $s1
		lw $s3, 0($s2)
		lw $s3, 32($s3)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $v0, $s3
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s3, $v0
		beqz $s3, L53
		move $s3, $s0
		lw $s2, 0($s3)
		lw $s2, 76($s2)
		move $s4, $s1
		lw $s5, 0($s4)
		lw $s5, 16($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s4
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s3
		move $a1, $s5
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		move $v1, $s5
		b L54
L53:
		li $v1, 1
		move $s5, $v1
		move $v1, $s5
L54:
		move $s5, $s1
		lw $s2, 0($s5)
		lw $s2, 20($s2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s5
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $a0, $s2
		jal _print
		move $s2, $s1
		lw $s5, 0($s2)
		lw $s5, 28($s5)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s2
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s5, $v0
		beqz $s5, L55
		move $s0, $s0
		lw $s5, 0($s0)
		lw $s5, 76($s5)
		move $s1, $s1
		lw $s2, 0($s1)
		lw $s2, 12($s2)
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s1
		move $v0, $s2
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		sw $t0, -40($fp)
		sw $t1, -44($fp)
		sw $t2, -48($fp)
		sw $t3, -52($fp)
		sw $t4, -56($fp)
		sw $t5, -60($fp)
		sw $t6, -64($fp)
		sw $t7, -68($fp)
		sw $t8, -72($fp)
		sw $t9, -76($fp)
		move $a0, $s0
		move $a1, $s2
		move $v0, $s5
		jalr $v0
		lw $t0, -40($fp)
		lw $t1, -44($fp)
		lw $t2, -48($fp)
		lw $t3, -52($fp)
		lw $t4, -56($fp)
		lw $t5, -60($fp)
		lw $t6, -64($fp)
		lw $t7, -68($fp)
		lw $t8, -72($fp)
		lw $t9, -76($fp)
		move $s2, $v0
		move $v1, $s2
		b L56
L55:
		li $v1, 1
		move $s2, $v1
		move $v1, $s2
L56:
		li $v1, 1
		move $s2, $v1
		move $v0, $s2
		lw $s0, -8($fp)
		lw $s1, -12($fp)
		lw $s2, -16($fp)
		lw $s3, -20($fp)
		lw $s4, -24($fp)
		lw $s5, -28($fp)
		lw $s6, -32($fp)
		lw $s7, -36($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl _halloc
_halloc:
		li $v0, 9
		syscall
		j $ra

	.text
	.globl _print
_print:
		li $v0, 1
		syscall
		la $a0, newl
		li $v0, 4
		syscall
		j $ra

		.data
		.align 0
newl:	.asciiz "\n"
