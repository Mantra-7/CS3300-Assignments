
	.text
	.globl main
main:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 48
		li $s0, 16
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $s1, 12
		move $a0, $s1
		jal _halloc
		move $s1, $v0
		move $s1, $s1
		la $s2, BBS_Print
		sw $s2, 8($s0)
		la $s2, BBS_Init
		sw $s2, 12($s0)
		la $s2, BBS_Start
		sw $s2, 0($s0)
		la $s2, BBS_Sort
		sw $s2, 4($s0)
		li $s2, 8
		move $s2, $s2
MAIN_L0:
		li $s3, 11
		sle $s3, $s2, $s3
		beqz $s3, MAIN_L1
		add $s3, $s1, $s2
		li $s4, 0
		sw $s4, 0($s3)
		li $s3, 4
		add $s3, $s2, $s3
		move $s2, $s3
		b MAIN_L0
MAIN_L1:
		sw $s0, 0($s1)
		move $s0, $s1
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 0($s1)
		move $s1, $v0
		li $s2, 10
		move $a0, $s0
		move $a1, $s2
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
		move $v0, $s1
		jalr $v0
		lw $t9, -44($fp)
		lw $t8, -40($fp)
		lw $t7, -36($fp)
		lw $t6, -32($fp)
		lw $t5, -28($fp)
		lw $t4, -24($fp)
		lw $t3, -20($fp)
		lw $t2, -16($fp)
		lw $t1, -12($fp)
		lw $t0, -8($fp)
		move $s0, $v0
		move $a0, $s0
		jal _print
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 48
		j $ra

	.text
	.globl BBS_Start
BBS_Start:
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
		move $s2, $a0
		move $s1, $a1
		li $s0, 0
		move $v1, $s0
		move $s0, $s2
		lw $v0, 0($s0)
		move $s3, $v0
		lw $v0, 12($s3)
		move $s3, $v0
		move $a0, $s0
		move $a1, $s1
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
		move $v0, $s3
		jalr $v0
		lw $t9, -76($fp)
		lw $t8, -72($fp)
		lw $t7, -68($fp)
		lw $t6, -64($fp)
		lw $t5, -60($fp)
		lw $t4, -56($fp)
		lw $t3, -52($fp)
		lw $t2, -48($fp)
		lw $t1, -44($fp)
		lw $t0, -40($fp)
		move $s0, $v0
		move $v1, $s0
		move $s0, $s2
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 8($s1)
		move $s1, $v0
		move $a0, $s0
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
		move $v0, $s1
		jalr $v0
		lw $t9, -76($fp)
		lw $t8, -72($fp)
		lw $t7, -68($fp)
		lw $t6, -64($fp)
		lw $t5, -60($fp)
		lw $t4, -56($fp)
		lw $t3, -52($fp)
		lw $t2, -48($fp)
		lw $t1, -44($fp)
		lw $t0, -40($fp)
		move $s0, $v0
		move $v1, $s0
		li $s0, 99999
		move $a0, $s0
		jal _print
		move $s0, $s2
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 4($s1)
		move $s1, $v0
		move $a0, $s0
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
		move $v0, $s1
		jalr $v0
		lw $t9, -76($fp)
		lw $t8, -72($fp)
		lw $t7, -68($fp)
		lw $t6, -64($fp)
		lw $t5, -60($fp)
		lw $t4, -56($fp)
		lw $t3, -52($fp)
		lw $t2, -48($fp)
		lw $t1, -44($fp)
		lw $t0, -40($fp)
		move $s0, $v0
		move $v1, $s0
		move $s0, $s2
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 8($s1)
		move $s1, $v0
		move $a0, $s0
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
		move $v0, $s1
		jalr $v0
		lw $t9, -76($fp)
		lw $t8, -72($fp)
		lw $t7, -68($fp)
		lw $t6, -64($fp)
		lw $t5, -60($fp)
		lw $t4, -56($fp)
		lw $t3, -52($fp)
		lw $t2, -48($fp)
		lw $t1, -44($fp)
		lw $t0, -40($fp)
		move $s0, $v0
		move $v1, $s0
		li $s0, 0
		move $v0, $s0
		lw $s7, -36($fp)
		lw $s6, -32($fp)
		lw $s5, -28($fp)
		lw $s4, -24($fp)
		lw $s3, -20($fp)
		lw $s2, -16($fp)
		lw $s1, -12($fp)
		lw $s0, -8($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 80
		j $ra

	.text
	.globl BBS_Sort
BBS_Sort:
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
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		lw $v0, 8($s1)
		move $s0, $v0
		li $s2, 1
		sub $s0, $s0, $s2
		move $s0, $s0
		li $s2, 0
		li $s3, 1
		sub $s2, $s2, $s3
		move $s2, $s2
BBS_Sort_L2:
		li $s3, 1
		sub $s3, $s0, $s3
		sle $s3, $s2, $s3
		beqz $s3, BBS_Sort_L3
		li $s3, 1
		move $s3, $s3
BBS_Sort_L4:
		sle $s4, $s3, $s0
		beqz $s4, BBS_Sort_L5
		li $s4, 1
		sub $s4, $s3, $s4
		move $s4, $s4
		lw $v0, 4($s1)
		move $s5, $v0
		li $s6, 4
		mul $s6, $s4, $s6
		lw $v0, 0($s5)
		move $s7, $v0
		li $t0, 1
		li $t1, 1
		sub $s7, $s7, $t1
		sle $s4, $s4, $s7
		sub $s4, $t0, $s4
		beqz $s4, BBS_Sort_L6
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L6:
		nop
		li $s4, 4
		add $s4, $s6, $s4
		add $s4, $s5, $s4
		lw $v0, 0($s4)
		move $s4, $v0
		move $s4, $s4
		lw $v0, 4($s1)
		move $s5, $v0
		li $s6, 4
		mul $s6, $s3, $s6
		lw $v0, 0($s5)
		move $s7, $v0
		li $t0, 1
		li $t1, 1
		sub $s7, $s7, $t1
		sle $s7, $s3, $s7
		sub $s7, $t0, $s7
		beqz $s7, BBS_Sort_L7
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L7:
		nop
		li $s7, 4
		add $s6, $s6, $s7
		add $s5, $s5, $s6
		lw $v0, 0($s5)
		move $s5, $v0
		move $s5, $s5
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s5, $s4
		beqz $s4, BBS_Sort_L8
		li $s4, 1
		sub $s4, $s3, $s4
		move $s4, $s4
		lw $v0, 4($s1)
		move $s5, $v0
		li $s6, 4
		mul $s6, $s4, $s6
		lw $v0, 0($s5)
		move $s7, $v0
		li $t0, 1
		li $t1, 1
		sub $s7, $s7, $t1
		sle $s7, $s4, $s7
		sub $s7, $t0, $s7
		beqz $s7, BBS_Sort_L10
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L10:
		nop
		li $s7, 4
		add $s6, $s6, $s7
		add $s5, $s5, $s6
		lw $v0, 0($s5)
		move $s5, $v0
		move $s5, $s5
		lw $v0, 4($s1)
		move $s6, $v0
		li $s7, 4
		mul $s7, $s3, $s7
		lw $v0, 0($s6)
		move $t0, $v0
		li $t1, 1
		li $t2, 1
		sub $t0, $t0, $t2
		sle $t0, $s3, $t0
		sub $t0, $t1, $t0
		beqz $t0, BBS_Sort_L11
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L11:
		nop
		li $t0, 4
		add $s7, $s7, $t0
		add $s6, $s6, $s7
		lw $v0, 0($s6)
		move $s6, $v0
		lw $v0, 4($s1)
		move $s7, $v0
		li $t0, 4
		mul $s4, $s4, $t0
		lw $v0, 0($s7)
		move $t0, $v0
		li $t1, 1
		li $t2, 1
		sub $t0, $t0, $t2
		sle $t0, $s4, $t0
		sub $t0, $t1, $t0
		beqz $t0, BBS_Sort_L12
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L12:
		nop
		li $t0, 4
		add $s4, $s4, $t0
		add $s4, $s7, $s4
		sw $s6, 0($s4)
		lw $v0, 4($s1)
		move $s4, $v0
		li $s6, 4
		mul $s6, $s3, $s6
		lw $v0, 0($s4)
		move $s7, $v0
		li $t0, 1
		li $t1, 1
		sub $s7, $s7, $t1
		sle $s7, $s6, $s7
		sub $s7, $t0, $s7
		beqz $s7, BBS_Sort_L13
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Sort_L13:
		nop
		li $s7, 4
		add $s6, $s6, $s7
		add $s4, $s4, $s6
		sw $s5, 0($s4)
		b BBS_Sort_L9
BBS_Sort_L8:
		li $s4, 0
		move $v1, $s4
BBS_Sort_L9:
		nop
		li $s4, 1
		add $s4, $s3, $s4
		move $s3, $s4
		b BBS_Sort_L4
BBS_Sort_L5:
		nop
		li $s3, 1
		sub $s3, $s0, $s3
		move $s0, $s3
		b BBS_Sort_L2
BBS_Sort_L3:
		nop
		li $s0, 0
		move $v0, $s0
		lw $s7, -36($fp)
		lw $s6, -32($fp)
		lw $s5, -28($fp)
		lw $s4, -24($fp)
		lw $s3, -20($fp)
		lw $s2, -16($fp)
		lw $s1, -12($fp)
		lw $s0, -8($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl BBS_Print
BBS_Print:
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
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $s0, $s0
BBS_Print_L14:
		lw $v0, 8($s1)
		move $s2, $v0
		li $s3, 1
		sub $s2, $s2, $s3
		sle $s2, $s0, $s2
		beqz $s2, BBS_Print_L15
		lw $v0, 4($s1)
		move $s2, $v0
		li $s3, 4
		mul $s3, $s0, $s3
		lw $v0, 0($s2)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Print_L16
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Print_L16:
		nop
		li $s4, 4
		add $s3, $s3, $s4
		add $s2, $s2, $s3
		lw $v0, 0($s2)
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $s2, 1
		add $s2, $s0, $s2
		move $s0, $s2
		b BBS_Print_L14
BBS_Print_L15:
		nop
		li $s0, 0
		move $v0, $s0
		lw $s7, -36($fp)
		lw $s6, -32($fp)
		lw $s5, -28($fp)
		lw $s4, -24($fp)
		lw $s3, -20($fp)
		lw $s2, -16($fp)
		lw $s1, -12($fp)
		lw $s0, -8($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
		j $ra

	.text
	.globl BBS_Init
BBS_Init:
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
		sw $s0, 8($s1)
		li $s2, 1
		add $s2, $s0, $s2
		li $s3, 4
		mul $s2, $s2, $s3
		move $a0, $s2
		jal _halloc
		move $s2, $v0
		move $s2, $s2
		li $s3, 4
		move $s3, $s3
BBS_Init_L17:
		li $s4, 1
		add $s4, $s0, $s4
		li $s5, 4
		mul $s4, $s4, $s5
		li $s5, 1
		sub $s4, $s4, $s5
		sle $s4, $s3, $s4
		beqz $s4, BBS_Init_L18
		add $s4, $s2, $s3
		li $s5, 0
		sw $s5, 0($s4)
		li $s4, 4
		add $s4, $s3, $s4
		move $s3, $s4
		b BBS_Init_L17
BBS_Init_L18:
		li $s3, 4
		mul $s0, $s0, $s3
		sw $s0, 0($s2)
		sw $s2, 4($s1)
		li $s0, 0
		li $s2, 20
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L19
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L19:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 1
		li $s2, 7
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L20
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L20:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 2
		li $s2, 12
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L21
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L21:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 3
		li $s2, 18
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L22
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L22:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 4
		li $s2, 2
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L23
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L23:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 5
		li $s2, 11
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L24
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L24:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 6
		li $s2, 6
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L25
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L25:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 7
		li $s2, 9
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L26
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L26:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 8
		li $s2, 19
		lw $v0, 4($s1)
		move $s3, $v0
		li $s4, 4
		mul $s0, $s0, $s4
		lw $v0, 0($s3)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $s4, $s4, $s6
		sle $s4, $s0, $s4
		sub $s4, $s5, $s4
		beqz $s4, BBS_Init_L27
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L27:
		nop
		li $s4, 4
		add $s0, $s0, $s4
		add $s0, $s3, $s0
		sw $s2, 0($s0)
		li $s0, 9
		li $s2, 5
		lw $v0, 4($s1)
		move $s1, $v0
		li $s3, 4
		mul $s0, $s0, $s3
		lw $v0, 0($s1)
		move $s3, $v0
		li $s4, 1
		li $s5, 1
		sub $s3, $s3, $s5
		sle $s3, $s0, $s3
		sub $s3, $s4, $s3
		beqz $s3, BBS_Init_L28
		la $a0, str_er
		syscall
		li $v0, 10
		syscall
BBS_Init_L28:
		nop
		li $s3, 4
		add $s0, $s0, $s3
		add $s0, $s1, $s0
		sw $s2, 0($s0)
		li $s0, 0
		move $v0, $s0
		lw $s7, -36($fp)
		lw $s6, -32($fp)
		lw $s5, -28($fp)
		lw $s4, -24($fp)
		lw $s3, -20($fp)
		lw $s2, -16($fp)
		lw $s1, -12($fp)
		lw $s0, -8($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 40
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

	.data
	.align   0
str_er:  .asciiz " ERROR: abnormal termination\n" 
