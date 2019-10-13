.data
	promptMessage:		.asciiz		"Enter a number to find its factorial"
	resultMessage:		.ascii		"\nThe factorial of the number is "
	theNumber:		.word		0
	theAnswer:		.word		0
	
.text
	.globl		__start
	__start:
		# prompt message
		li		$v0		4
		la		$a0		promptMessage
		syscall
		
		# read number
		li		$v0		5
		syscall

		sw 		$v0		theNumber
		
		lw		$a0		theNumber
		jal		findFactorial
		sw		$v1		theAnswer
		
		li		$v0		4
		la		$a0		resultMessage
		syscall
		
		li		$v0		1
		lw		$a0		theAnswer
		syscall
		
		li		$v0		10
		syscall
		
		
	.globl		findFactorial
	findFactorial:
		subu		$sp		$sp		8
		sw		$ra		0($sp)
		sw		$s0		4($sp)
		
		# base case
		li		$v0		1
		beqz		$a0		factorialDone
		
		# find factorial f(theNumber - 1)
		move 		$s0		$a0
		sub		$a0		$a0		1
		jal		findFactorial
		addi		$v1		$v1		1
		mul		$v0		$s0		$v0
		
	factorialDone:
		lw		$ra		0($sp)
		lw		$s0		4($sp)
		addu		$sp		$sp		8
		
		jr		$ra		