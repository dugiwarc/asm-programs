	.data 
		prompt: .asciiz "Enter your age: "
		message: .asciiz "\nYour age is "	
	.text
		# Prompt the user to enter age 
		li $v0, 4 # tell the computer we are about to print a string or a text
		la $a0, prompt # load address of prompt
		syscall
		
	# Get the user's age
	li $v0, 5 # get an integer from the keyboard
	syscall # pause and wait for input
	
	# Store the result in $t0 from $v0
	move $t0, $v0
	
	# Display the message
	li $v0, 4 # we are about to display string
	la $a0, message # loading message to arg $a0
	syscall
	
	# Print or show the age
	li $v0, 1 # 1 for integer
	move $a0, $t0 # move age to arg $a0
	syscall