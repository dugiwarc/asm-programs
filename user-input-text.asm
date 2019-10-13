.data
	message: 	.asciiz		"Hello, "
	# Variable to hold an array of 20 characters
	userInput:	.space		20
.text
	main:
		# Display/Read
		li 	$v0, 8			# Display code : 8
		la 	$a0, userInput
		# Specifiy length : 20 bytes
		li 	$a1, 20
		syscall
		
		# Display/Read
		li	$v0, 4			# Read code : 4
		la	$a0, message
		syscall
		
		# Display/Read
		li 	$v0, 4
		la	$a0, userInput
		syscall
	
	# End of main instruction
	li	$v0, 10
	syscall