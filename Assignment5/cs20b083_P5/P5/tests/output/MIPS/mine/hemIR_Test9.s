
	.text
	.globl main
main:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 48
		li $s0, 4
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $s1, 4
		move $a0, $s1
		jal _halloc
		move $s1, $v0
		move $s1, $s1
		la $s2, Test_Start
		sw $s2, 0($s0)
		sw $s0, 0($s1)
		move $s0, $s1
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 0($s1)
		move $s1, $v0
		move $a0, $s0
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
	.globl ArrayTest_test
ArrayTest_test:
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
		move $s2, $a0
		move $s1, $a1
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 1
		add $v0, $s1, $s0
		move $s0, $v0
		li $s3, 4
		mul $v0, $s0, $s3
		move $s0, $v0
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $s3, 4
		move $s3, $s3
ArrayTest_test_L2:
		li $s4, 1
		add $v0, $s1, $s4
		move $s4, $v0
		li $s5, 4
		mul $v0, $s4, $s5
		move $s4, $v0
		li $s5, 1
		sub $v0, $s4, $s5
		move $s4, $v0
		sle $v0, $s3, $s4
		move $s4, $v0
		beqz $s4, ArrayTest_test_L3
		add $v0, $s0, $s3
		move $s4, $v0
		li $s5, 0
		sw $s5, 0($s4)
		li $s4, 4
		add $v0, $s3, $s4
		move $s4, $v0
		move $s3, $s4
		b ArrayTest_test_L2
ArrayTest_test_L3:
		li $s3, 4
		mul $v0, $s1, $s3
		move $s1, $v0
		sw $s1, 0($s0)
		move $s0, $s0
		li $s1, 0
		sw $s1, 12($s2)
		lw $v0, 12($s2)
		move $s1, $v0
		move $a0, $s1
		jal _print
		lw $v0, 0($s0)
		move $s1, $v0
		li $s2, 4
		div $v0, $s1, $s2
		move $s1, $v0
		move $a0, $s1
		jal _print
		li $s1, 0
		move $s1, $s1
		li $s2, 111
		move $a0, $s2
		jal _print
ArrayTest_test_L4:
		lw $v0, 0($s0)
		move $s2, $v0
		li $s3, 4
		div $v0, $s2, $s3
		move $s2, $v0
		li $s3, 1
		sub $v0, $s2, $s3
		move $s2, $v0
		sle $v0, $s1, $s2
		move $s2, $v0
		beqz $s2, ArrayTest_test_L5
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		li $s3, 4
		mul $v0, $s1, $s3
		move $s3, $v0
		lw $v0, 0($s0)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $v0, $s4, $s6
		move $s4, $v0
		sle $v0, $s3, $s4
		move $s4, $v0
		sub $v0, $s5, $s4
		move $s4, $v0
		beqz $s4, ArrayTest_test_L6
ArrayTest_test_L6:
		li $s4, 4
		add $v0, $s3, $s4
		move $s3, $v0
		add $v0, $s0, $s3
		move $s3, $v0
		sw $s2, 0($s3)
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $s1, $s2
		b ArrayTest_test_L4
ArrayTest_test_L5:
		li $s2, 222
		move $a0, $s2
		jal _print
		li $s2, 0
		move $s1, $s2
ArrayTest_test_L7:
		lw $v0, 0($s0)
		move $s2, $v0
		li $s3, 4
		div $v0, $s2, $s3
		move $s2, $v0
		li $s3, 1
		sub $v0, $s2, $s3
		move $s2, $v0
		sle $v0, $s1, $s2
		move $s2, $v0
		beqz $s2, ArrayTest_test_L8
		li $s2, 4
		mul $v0, $s1, $s2
		move $s2, $v0
		lw $v0, 0($s0)
		move $s3, $v0
		li $s4, 1
		li $s5, 1
		sub $v0, $s3, $s5
		move $s3, $v0
		sle $v0, $s1, $s3
		move $s3, $v0
		sub $v0, $s4, $s3
		move $s3, $v0
		beqz $s3, ArrayTest_test_L9
ArrayTest_test_L9:
		li $s3, 4
		add $v0, $s2, $s3
		move $s2, $v0
		add $v0, $s0, $s2
		move $s2, $v0
		lw $v0, 0($s2)
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $s1, $s2
		b ArrayTest_test_L7
ArrayTest_test_L8:
		li $s1, 333
		move $a0, $s1
		jal _print
		lw $v0, 0($s0)
		move $s0, $v0
		li $s1, 4
		div $v0, $s0, $s1
		move $s0, $v0
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
	.globl B_test
B_test:
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
		move $s2, $a0
		move $s1, $a1
		li $s0, 0
		move $v1, $s0
		li $s0, 0
		move $v1, $s0
		li $s0, 1
		add $v0, $s1, $s0
		move $s0, $v0
		li $s3, 4
		mul $v0, $s0, $s3
		move $s0, $v0
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $s3, 4
		move $s3, $s3
B_test_L10:
		li $s4, 1
		add $v0, $s1, $s4
		move $s4, $v0
		li $s5, 4
		mul $v0, $s4, $s5
		move $s4, $v0
		li $s5, 1
		sub $v0, $s4, $s5
		move $s4, $v0
		sle $v0, $s3, $s4
		move $s4, $v0
		beqz $s4, B_test_L11
		add $v0, $s0, $s3
		move $s4, $v0
		li $s5, 0
		sw $s5, 0($s4)
		li $s4, 4
		add $v0, $s3, $s4
		move $s4, $v0
		move $s3, $s4
		b B_test_L10
B_test_L11:
		li $s3, 4
		mul $v0, $s1, $s3
		move $s1, $v0
		sw $s1, 0($s0)
		move $s0, $s0
		li $s1, 12
		sw $s1, 16($s2)
		lw $v0, 16($s2)
		move $s1, $v0
		move $a0, $s1
		jal _print
		lw $v0, 0($s0)
		move $s1, $v0
		li $s2, 4
		div $v0, $s1, $s2
		move $s1, $v0
		move $a0, $s1
		jal _print
		li $s1, 0
		move $s1, $s1
		li $s2, 111
		move $a0, $s2
		jal _print
B_test_L12:
		lw $v0, 0($s0)
		move $s2, $v0
		li $s3, 4
		div $v0, $s2, $s3
		move $s2, $v0
		li $s3, 1
		sub $v0, $s2, $s3
		move $s2, $v0
		sle $v0, $s1, $s2
		move $s2, $v0
		beqz $s2, B_test_L13
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		li $s3, 4
		mul $v0, $s1, $s3
		move $s3, $v0
		lw $v0, 0($s0)
		move $s4, $v0
		li $s5, 1
		li $s6, 1
		sub $v0, $s4, $s6
		move $s4, $v0
		sle $v0, $s3, $s4
		move $s4, $v0
		sub $v0, $s5, $s4
		move $s4, $v0
		beqz $s4, B_test_L14
B_test_L14:
		li $s4, 4
		add $v0, $s3, $s4
		move $s3, $v0
		add $v0, $s0, $s3
		move $s3, $v0
		sw $s2, 0($s3)
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $s1, $s2
		b B_test_L12
B_test_L13:
		li $s2, 222
		move $a0, $s2
		jal _print
		li $s2, 0
		move $s1, $s2
B_test_L15:
		lw $v0, 0($s0)
		move $s2, $v0
		li $s3, 4
		div $v0, $s2, $s3
		move $s2, $v0
		li $s3, 1
		sub $v0, $s2, $s3
		move $s2, $v0
		sle $v0, $s1, $s2
		move $s2, $v0
		beqz $s2, B_test_L16
		li $s2, 4
		mul $v0, $s1, $s2
		move $s2, $v0
		lw $v0, 0($s0)
		move $s3, $v0
		li $s4, 1
		li $s5, 1
		sub $v0, $s3, $s5
		move $s3, $v0
		sle $v0, $s1, $s3
		move $s3, $v0
		sub $v0, $s4, $s3
		move $s3, $v0
		beqz $s3, B_test_L17
B_test_L17:
		li $s3, 4
		add $v0, $s2, $s3
		move $s2, $v0
		add $v0, $s0, $s2
		move $s2, $v0
		lw $v0, 0($s2)
		move $s2, $v0
		move $a0, $s2
		jal _print
		li $s2, 1
		add $v0, $s1, $s2
		move $s2, $v0
		move $s1, $s2
		b B_test_L15
B_test_L16:
		li $s1, 333
		move $a0, $s1
		jal _print
		lw $v0, 0($s0)
		move $s0, $v0
		li $s1, 4
		div $v0, $s0, $s1
		move $s0, $v0
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
	.globl Test_Start
Test_Start:
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
		li $s0, 0
		move $v1, $s0
		li $s0, 4
		move $a0, $s0
		jal _halloc
		move $s0, $v0
		move $s0, $s0
		li $s1, 16
		move $a0, $s1
		jal _halloc
		move $s1, $v0
		move $s1, $s1
		la $s2, ArrayTest_test
		sw $s2, 0($s0)
		li $s2, 8
		move $s2, $s2
Test_Start_L18:
		li $s3, 15
		sle $v0, $s2, $s3
		move $s3, $v0
		beqz $s3, Test_Start_L19
		add $v0, $s1, $s2
		move $s3, $v0
		li $s4, 0
		sw $s4, 0($s3)
		li $s3, 4
		add $v0, $s2, $s3
		move $s3, $v0
		move $s2, $s3
		b Test_Start_L18
Test_Start_L19:
		sw $s0, 0($s1)
		move $s0, $s1
		move $s0, $s0
		lw $v0, 0($s0)
		move $s1, $v0
		lw $v0, 0($s1)
		move $s1, $v0
		li $s2, 3
		move $a0, $s0
		move $a1, $s2
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
		move $a0, $s0
		jal _print
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
