
	.text
	.globl main
main:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 48
		la $s0, rnad_1
		li $s1, 1
		li $v1, 2
		li $s2, 12
		move $a0, $s2
		jal _halloc
		move $s3, $v0
		sw $s2, 0($s3)
		move $s2, $s2
		li $s4, 13
		move $a0, $s1
		move $a1, $s3
		move $a2, $s2
		move $a3, $s4
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
		move $v0, $s0
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
		sw $s0, 4($s3)
		lw $v0, 0($s3)
		move $s0, $v0
		lw $v0, 4($s3)
		move $s1, $v0
		add $s2, $s0, $s1
		sw $s2, 8($s3)
		move $a0, $s3
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
		la $v0, rnad_2
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
		move $s2, $v0
		sle $s3, $s0, $s1
		move $s3, $s3
		move $a0, $s3
		jal _print
		sne $s3, $s0, $s1
		move $s3, $s3
		move $a0, $s3
		jal _print
		sub $s3, $s0, $s1
		move $s3, $s3
		move $a0, $s3
		jal _print
		mul $s3, $s0, $s1
		move $s3, $s3
		move $a0, $s3
		jal _print
		div $s3, $s0, $s1
		move $s3, $s3
		move $a0, $s3
		jal _print
		add $s0, $s0, $s1
		move $s0, $s0
		move $a0, $s0
		jal _print
		move $a0, $s2
		jal _print
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 48
		j $ra

	.text
	.globl rnad_1
rnad_1:
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
		move $v1, $a2
		move $s2, $a3
		move $a0, $s0
		move $a1, $s1
		move $a2, $s2
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
		la $v0, rnad_3
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
		move $s3, $v0
		move $v0, $s3
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
	.globl rnad_2
rnad_2:
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
		move $s1, $s0
		li $v1, 0
		lw $v0, 0($s1)
		move $s0, $v0
		li $s2, 4
		move $a0, $s0
		jal _print
		lw $v0, 4($s1)
		move $s0, $v0
		move $a0, $s0
		jal _print
		lw $v0, 8($s1)
		move $s0, $v0
		move $a0, $s0
		jal _print
		move $v0, $s2
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
	.globl rnad_3
rnad_3:
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
		move $s3, $a2
		add $s0, $s3, 18
		lw $v0, 0($s2)
		move $s4, $v0
		sub $s5, $s4, $s3
		lw $v0, 0($s2)
		move $s6, $v0
		mul $s7, $s6, $s0
		move $a0, $s1
		move $a1, $s2
		move $a2, $s3
		move $a3, $s0
		sw $s4, -8($sp)
		sw $s5, -12($sp)
		sw $s6, -16($sp)
		sw $s7, -20($sp)
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
		la $v0, rnad_4
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
		move $v1, $v0
		move $s2, $s1
		move $s3, $s2
		move $s0, $s3
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
	.globl rnad_4
rnad_4:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 56
		sw $s0, -24($fp)
		sw $s1, -28($fp)
		sw $s2, -32($fp)
		sw $s3, -36($fp)
		sw $s4, -40($fp)
		sw $s5, -44($fp)
		sw $s6, -48($fp)
		sw $s7, -52($fp)
		move $v1, $a0
		move $v1, $a1
		move $s4, $a2
		move $s5, $a3
		lw $v0, -8($fp)
		move $s0, $v0
		lw $v0, -12($fp)
		move $s3, $v0
		lw $v0, -16($fp)
		move $s1, $v0
		lw $v0, -20($fp)
		move $s2, $v0
		move $a0, $s4
		jal _print
		move $a0, $s5
		jal _print
		move $a0, $s0
		jal _print
		move $a0, $s3
		jal _print
		move $a0, $s1
		jal _print
		move $a0, $s2
		jal _print
		sle $s0, $s4, $s3
		move $a0, $s0
		jal _print
		move $s0, $s4
		move $a0, $s0
		jal _print
		move $s0, $s5
		move $v0, $s0
		lw $s7, -52($fp)
		lw $s6, -48($fp)
		lw $s5, -44($fp)
		lw $s4, -40($fp)
		lw $s3, -36($fp)
		lw $s2, -32($fp)
		lw $s1, -28($fp)
		lw $s0, -24($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 56
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
