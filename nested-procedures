
		.data
		newLine: .asciiz "\n"
	.text
		main: 
			addi $s0, $zero, 10
			
			# call the function jump-and-link
			jal increaseMyRegister
			
			# Prints a newline
			li $v0, 4
			# Load address
			la $a0, newLine
			syscall
			
			jal printTheValue
			
	# This line is going to signal end of progress
	li $v0, 10
	syscall
	
	increaseMyRegister:
		# allocate 4 bytes in the stack(4 bytes per element)
		addi $sp, $sp, -8
		# save word into $s0, from location 0 in the stack($sp)
		# because we used an s0 it has to be the stack
		sw $s0, 0($sp)
		# save address of function  in RAM
		sw $ra, 4($sp)
		
		# add 30 to $s0
		addi $s0, $s0, 30
		
		# NESTED FUNCTION
		jal printTheValue
		
		# load from RAM
		lw $s0, 0($sp)
		# load address
		lw $ra, 4($sp)
		# restore the values in the stack(4 because we subtracted 4)
		addi $sp, $sp, 4
		
		# return to main
		jr $ra
		
	printTheValue:
		# print new value in function
		li $v0, 1
		move $a0, $s0
		syscall
		
		# return to main
		jr $ra