.data
	messageE:	.asciiz "Equal."
	messageNE:	.asciiz "Not equal."
	messageLT:	.asciiz "Less than."
.text
	main: 
		addi		$t0, $zero, 15
		addi 		$t1, $zero, 20
		
		# If $t0 and $t1 are equal execute numbersEqual()
		# beq $t0, $t1, numbersEqual		# If equal
		# bne $t0, $t1, numbersNotEqual		# If !equal
		# bgtz $t0, function()			# If Bigger than zero
		# Boolean will be stored in $s0 on the relationship ($t0, $t1) 
		slt $s0, $t0, $t1 			# Is $t0 lt $t1
		bne $s0, $zero, numberLessThan
	
		# End of program instruction
		li		$v0, 10
		syscall
	
	numbersEqual:
		# Display
		li	$v0, 4
		la	$a0, messageE
		syscall
		
		# End of program instruction
		li		$v0, 10
		syscall
		
	numbersNotEqual:
		# Display
		li	$v0, 4
		la	$a0, messageNE
		syscall
		
		# End of program instruction
		li		$v0, 10
		syscall
		
	numberLessThan:
		# Display
		li	$v0, 4
		la	$a0, messageLT
		syscall
		
		# End of program instruction
		li		$v0, 10
		syscall