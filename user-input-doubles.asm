.data 
	prompt:		.asciiz "Enter the value of e: "
		
.text
	# Display message to the screen
	li $v0, 4 			# Instruction to display text
	la $a0, prompt
	syscall
	
	# Get the double from the user
	li $v0, 7			# Will be stored in $f0
	syscall
	
	# Display the user's input
	li 	$v0, 3 			# Instruction to display to the screen
	add.d 	$f12, $f0, $f10 	# Have to move from $f0 to the argument (Why?)
	syscall
