
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
		move $s1, $v0
		li $s2, 0
		sw $s2, 0($s1)
		li $s0, 4
		move $a0, $s0
		jal _halloc
		move $s3, $v0
		la $s4, hmm_mo
		sw $s4, 0($s3)
		sw $s3, 0($s1)
		lw $v0, 0($s1)
		move $s4, $v0
		lw $v0, 0($s4)
		move $s4, $v0
		li $s0, 1
		li $s2, 2
		li $s5, 3
		li $s6, 4
		li $s7, 5
		li $t0, 6
		li $t1, 7
		li $t2, 8
		move $a0, $s1
		move $a1, $s0
		move $a2, $s2
		move $a3, $s5
		sw $s6, -8($sp)
		sw $s7, -12($sp)
		sw $t0, -16($sp)
		sw $t1, -20($sp)
		sw $t2, -24($sp)
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
		move $v0, $s4
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
		move $s3, $v0
		move $a0, $s3
		jal _print
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 48
		j $ra

	.text
	.globl hmm_mo
hmm_mo:
		sw $fp, 0($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 404
		sw $s0, -372($fp)
		sw $s1, -376($fp)
		sw $s2, -380($fp)
		sw $s3, -384($fp)
		sw $s4, -388($fp)
		sw $s5, -392($fp)
		sw $s6, -396($fp)
		sw $s7, -400($fp)
		move $v1, $a0
		move $s1, $a1
		move $s2, $a2
		move $s3, $a3
		lw $v0, -8($fp)
		move $s4, $v0
		lw $v0, -12($fp)
		move $s5, $v0
		lw $v0, -16($fp)
		move $s6, $v0
		lw $v0, -20($fp)
		move $s7, $v0
		lw $v0, -24($fp)
		move $t0, $v0
		li $s0, 10
		move $s0, $s0
		li $t1, 11
		move $t1, $t1
		li $t2, 12
		move $t2, $t2
		li $t3, 13
		move $t3, $t3
		li $t4, 14
		move $t4, $t4
		li $t5, 15
		move $t5, $t5
		li $t6, 16
		move $t6, $t6
		li $t7, 17
		move $t7, $t7
		li $t8, 18
		move $t8, $t8
		li $t9, 19
		move $v0, $t9
		sw $v0, -28($fp)
		li $t9, 20
		move $v0, $t9
		sw $v0, -32($fp)
		li $t9, 21
		move $v0, $t9
		sw $v0, -36($fp)
		li $t9, 22
		move $v0, $t9
		sw $v0, -40($fp)
		li $t9, 23
		move $v0, $t9
		sw $v0, -44($fp)
		li $t9, 24
		move $v0, $t9
		sw $v0, -48($fp)
		li $t9, 25
		move $v0, $t9
		sw $v0, -52($fp)
		li $t9, 26
		move $v0, $t9
		sw $v0, -56($fp)
		li $t9, 27
		move $v0, $t9
		sw $v0, -60($fp)
		li $t9, 28
		move $v0, $t9
		sw $v0, -64($fp)
		li $t9, 29
		move $v0, $t9
		sw $v0, -68($fp)
		li $t9, 30
		move $v0, $t9
		sw $v0, -72($fp)
		li $t9, 31
		move $v0, $t9
		sw $v0, -76($fp)
		li $t9, 32
		move $v0, $t9
		sw $v0, -80($fp)
		li $t9, 33
		move $v0, $t9
		sw $v0, -84($fp)
		li $t9, 34
		move $v0, $t9
		sw $v0, -88($fp)
		li $t9, 35
		move $v0, $t9
		sw $v0, -92($fp)
		li $t9, 36
		move $v0, $t9
		sw $v0, -96($fp)
		li $t9, 37
		move $v0, $t9
		sw $v0, -100($fp)
		li $t9, 38
		move $v0, $t9
		sw $v0, -104($fp)
		li $t9, 39
		move $v0, $t9
		sw $v0, -108($fp)
		li $t9, 40
		move $v0, $t9
		sw $v0, -112($fp)
		li $t9, 41
		move $v0, $t9
		sw $v0, -116($fp)
		li $t9, 42
		move $v0, $t9
		sw $v0, -120($fp)
		li $t9, 43
		move $v0, $t9
		sw $v0, -124($fp)
		li $t9, 44
		move $v0, $t9
		sw $v0, -128($fp)
		li $t9, 45
		move $v0, $t9
		sw $v0, -132($fp)
		li $t9, 46
		move $v0, $t9
		sw $v0, -136($fp)
		li $t9, 47
		move $v0, $t9
		sw $v0, -140($fp)
		li $t9, 48
		move $v0, $t9
		sw $v0, -144($fp)
		li $t9, 49
		move $v0, $t9
		sw $v0, -148($fp)
		li $t9, 50
		move $v0, $t9
		sw $v0, -152($fp)
		li $t9, 51
		move $v0, $t9
		sw $v0, -156($fp)
		li $t9, 52
		move $v0, $t9
		sw $v0, -160($fp)
		li $t9, 53
		move $v0, $t9
		sw $v0, -164($fp)
		li $t9, 54
		move $v0, $t9
		sw $v0, -168($fp)
		li $t9, 55
		move $v0, $t9
		sw $v0, -172($fp)
		li $t9, 56
		move $v0, $t9
		sw $v0, -176($fp)
		li $t9, 57
		move $v0, $t9
		sw $v0, -180($fp)
		li $t9, 58
		move $v0, $t9
		sw $v0, -184($fp)
		li $t9, 59
		move $v0, $t9
		sw $v0, -188($fp)
		li $t9, 60
		move $v0, $t9
		sw $v0, -192($fp)
		li $t9, 61
		move $v0, $t9
		sw $v0, -196($fp)
		li $t9, 62
		move $v0, $t9
		sw $v0, -200($fp)
		li $t9, 63
		move $v0, $t9
		sw $v0, -204($fp)
		li $t9, 64
		move $v0, $t9
		sw $v0, -208($fp)
		li $t9, 65
		move $v0, $t9
		sw $v0, -212($fp)
		li $t9, 66
		move $v0, $t9
		sw $v0, -216($fp)
		li $t9, 67
		move $v0, $t9
		sw $v0, -220($fp)
		li $t9, 68
		move $v0, $t9
		sw $v0, -224($fp)
		li $t9, 69
		move $v0, $t9
		sw $v0, -228($fp)
		li $t9, 70
		move $v0, $t9
		sw $v0, -232($fp)
		li $t9, 71
		move $v0, $t9
		sw $v0, -236($fp)
		li $t9, 72
		move $v0, $t9
		sw $v0, -240($fp)
		li $t9, 73
		move $v0, $t9
		sw $v0, -244($fp)
		li $t9, 74
		move $v0, $t9
		sw $v0, -248($fp)
		li $t9, 75
		move $v0, $t9
		sw $v0, -252($fp)
		li $t9, 76
		move $v0, $t9
		sw $v0, -256($fp)
		li $t9, 77
		move $v0, $t9
		sw $v0, -260($fp)
		li $t9, 78
		move $v0, $t9
		sw $v0, -264($fp)
		li $t9, 79
		move $v0, $t9
		sw $v0, -268($fp)
		li $t9, 80
		move $v0, $t9
		sw $v0, -272($fp)
		li $t9, 81
		move $v0, $t9
		sw $v0, -276($fp)
		li $t9, 82
		move $v0, $t9
		sw $v0, -280($fp)
		li $t9, 83
		move $v0, $t9
		sw $v0, -284($fp)
		li $t9, 84
		move $v0, $t9
		sw $v0, -288($fp)
		li $t9, 85
		move $v0, $t9
		sw $v0, -292($fp)
		li $t9, 86
		move $v0, $t9
		sw $v0, -296($fp)
		li $t9, 87
		move $v0, $t9
		sw $v0, -300($fp)
		li $t9, 88
		move $v0, $t9
		sw $v0, -304($fp)
		li $t9, 89
		move $v0, $t9
		sw $v0, -308($fp)
		li $t9, 90
		move $v0, $t9
		sw $v0, -312($fp)
		li $t9, 91
		move $v0, $t9
		sw $v0, -316($fp)
		li $t9, 92
		move $v0, $t9
		sw $v0, -320($fp)
		li $t9, 93
		move $v0, $t9
		sw $v0, -324($fp)
		li $t9, 94
		move $v0, $t9
		sw $v0, -328($fp)
		li $t9, 95
		move $v0, $t9
		sw $v0, -332($fp)
		li $t9, 96
		move $v0, $t9
		sw $v0, -336($fp)
		li $t9, 97
		move $v0, $t9
		sw $v0, -340($fp)
		li $t9, 98
		move $v0, $t9
		sw $v0, -344($fp)
		li $t9, 99
		move $v0, $t9
		sw $v0, -348($fp)
		li $t9, 100
		move $v0, $t9
		sw $v0, -352($fp)
		li $t9, 101
		move $v0, $t9
		sw $v0, -356($fp)
		li $t9, 102
		move $v0, $t9
		sw $v0, -360($fp)
		li $t9, 103
		move $v0, $t9
		sw $v0, -364($fp)
		li $t9, 104
		move $v0, $t9
		sw $v0, -368($fp)
		li $t9, 105
		move $t9, $t9
		move $a0, $s1
		jal _print
		move $a0, $s2
		jal _print
		move $a0, $s3
		jal _print
		move $a0, $s4
		jal _print
		move $a0, $s5
		jal _print
		move $a0, $s6
		jal _print
		move $a0, $s7
		jal _print
		move $a0, $t0
		jal _print
		move $a0, $s0
		jal _print
		move $a0, $t1
		jal _print
		move $a0, $t2
		jal _print
		move $a0, $t3
		jal _print
		move $a0, $t4
		jal _print
		move $a0, $t5
		jal _print
		move $a0, $t6
		jal _print
		move $a0, $t7
		jal _print
		move $a0, $t8
		jal _print
		lw $v0, -28($fp)
		move $a0, $v0
		jal _print
		lw $v0, -32($fp)
		move $a0, $v0
		jal _print
		lw $v0, -36($fp)
		move $a0, $v0
		jal _print
		lw $v0, -40($fp)
		move $a0, $v0
		jal _print
		lw $v0, -44($fp)
		move $a0, $v0
		jal _print
		lw $v0, -48($fp)
		move $a0, $v0
		jal _print
		lw $v0, -52($fp)
		move $a0, $v0
		jal _print
		lw $v0, -56($fp)
		move $a0, $v0
		jal _print
		lw $v0, -60($fp)
		move $a0, $v0
		jal _print
		lw $v0, -64($fp)
		move $a0, $v0
		jal _print
		lw $v0, -68($fp)
		move $a0, $v0
		jal _print
		lw $v0, -72($fp)
		move $a0, $v0
		jal _print
		lw $v0, -76($fp)
		move $a0, $v0
		jal _print
		lw $v0, -80($fp)
		move $a0, $v0
		jal _print
		lw $v0, -84($fp)
		move $a0, $v0
		jal _print
		lw $v0, -88($fp)
		move $a0, $v0
		jal _print
		lw $v0, -92($fp)
		move $a0, $v0
		jal _print
		lw $v0, -96($fp)
		move $a0, $v0
		jal _print
		lw $v0, -100($fp)
		move $a0, $v0
		jal _print
		lw $v0, -104($fp)
		move $a0, $v0
		jal _print
		lw $v0, -108($fp)
		move $a0, $v0
		jal _print
		lw $v0, -112($fp)
		move $a0, $v0
		jal _print
		lw $v0, -116($fp)
		move $a0, $v0
		jal _print
		lw $v0, -120($fp)
		move $a0, $v0
		jal _print
		lw $v0, -124($fp)
		move $a0, $v0
		jal _print
		lw $v0, -128($fp)
		move $a0, $v0
		jal _print
		lw $v0, -132($fp)
		move $a0, $v0
		jal _print
		lw $v0, -136($fp)
		move $a0, $v0
		jal _print
		lw $v0, -140($fp)
		move $a0, $v0
		jal _print
		lw $v0, -144($fp)
		move $a0, $v0
		jal _print
		lw $v0, -148($fp)
		move $a0, $v0
		jal _print
		lw $v0, -152($fp)
		move $a0, $v0
		jal _print
		lw $v0, -156($fp)
		move $a0, $v0
		jal _print
		lw $v0, -160($fp)
		move $a0, $v0
		jal _print
		lw $v0, -164($fp)
		move $a0, $v0
		jal _print
		lw $v0, -168($fp)
		move $a0, $v0
		jal _print
		lw $v0, -172($fp)
		move $a0, $v0
		jal _print
		lw $v0, -176($fp)
		move $a0, $v0
		jal _print
		lw $v0, -180($fp)
		move $a0, $v0
		jal _print
		lw $v0, -184($fp)
		move $a0, $v0
		jal _print
		lw $v0, -188($fp)
		move $a0, $v0
		jal _print
		lw $v0, -192($fp)
		move $a0, $v0
		jal _print
		lw $v0, -196($fp)
		move $a0, $v0
		jal _print
		lw $v0, -200($fp)
		move $a0, $v0
		jal _print
		lw $v0, -204($fp)
		move $a0, $v0
		jal _print
		lw $v0, -208($fp)
		move $a0, $v0
		jal _print
		lw $v0, -212($fp)
		move $a0, $v0
		jal _print
		lw $v0, -216($fp)
		move $a0, $v0
		jal _print
		lw $v0, -220($fp)
		move $a0, $v0
		jal _print
		lw $v0, -224($fp)
		move $a0, $v0
		jal _print
		lw $v0, -228($fp)
		move $a0, $v0
		jal _print
		lw $v0, -232($fp)
		move $a0, $v0
		jal _print
		lw $v0, -236($fp)
		move $a0, $v0
		jal _print
		lw $v0, -240($fp)
		move $a0, $v0
		jal _print
		lw $v0, -244($fp)
		move $a0, $v0
		jal _print
		lw $v0, -248($fp)
		move $a0, $v0
		jal _print
		lw $v0, -252($fp)
		move $a0, $v0
		jal _print
		lw $v0, -256($fp)
		move $a0, $v0
		jal _print
		lw $v0, -260($fp)
		move $a0, $v0
		jal _print
		lw $v0, -264($fp)
		move $a0, $v0
		jal _print
		lw $v0, -268($fp)
		move $a0, $v0
		jal _print
		lw $v0, -272($fp)
		move $a0, $v0
		jal _print
		lw $v0, -276($fp)
		move $a0, $v0
		jal _print
		lw $v0, -280($fp)
		move $a0, $v0
		jal _print
		lw $v0, -284($fp)
		move $a0, $v0
		jal _print
		lw $v0, -288($fp)
		move $a0, $v0
		jal _print
		lw $v0, -292($fp)
		move $a0, $v0
		jal _print
		lw $v0, -296($fp)
		move $a0, $v0
		jal _print
		lw $v0, -300($fp)
		move $a0, $v0
		jal _print
		lw $v0, -304($fp)
		move $a0, $v0
		jal _print
		lw $v0, -308($fp)
		move $a0, $v0
		jal _print
		lw $v0, -312($fp)
		move $a0, $v0
		jal _print
		lw $v0, -316($fp)
		move $a0, $v0
		jal _print
		lw $v0, -320($fp)
		move $a0, $v0
		jal _print
		lw $v0, -324($fp)
		move $a0, $v0
		jal _print
		lw $v0, -328($fp)
		move $a0, $v0
		jal _print
		lw $v0, -332($fp)
		move $a0, $v0
		jal _print
		lw $v0, -336($fp)
		move $a0, $v0
		jal _print
		lw $v0, -340($fp)
		move $a0, $v0
		jal _print
		lw $v0, -344($fp)
		move $a0, $v0
		jal _print
		lw $v0, -348($fp)
		move $a0, $v0
		jal _print
		lw $v0, -352($fp)
		move $a0, $v0
		jal _print
		lw $v0, -356($fp)
		move $a0, $v0
		jal _print
		lw $v0, -360($fp)
		move $a0, $v0
		jal _print
		lw $v0, -364($fp)
		move $a0, $v0
		jal _print
		lw $v0, -368($fp)
		move $a0, $v0
		jal _print
		move $a0, $t9
		jal _print
		li $s0, 0
		move $v0, $s0
		lw $s7, -400($fp)
		lw $s6, -396($fp)
		lw $s5, -392($fp)
		lw $s4, -388($fp)
		lw $s3, -384($fp)
		lw $s2, -380($fp)
		lw $s1, -376($fp)
		lw $s0, -372($fp)
		lw $ra, -4($fp)
		lw $fp, 0($fp)
		addu $sp, $sp, 404
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
