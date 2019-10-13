# there's no add immediata or li when using floats
# there's no default registers for floats
		.data
			message: 	.asciiz "Enter the value of PI: "
			zeroAsFloat: 	.float 0.0
		.text
		# Load word call processor 1
		lwc1 $f4, zeroAsFloat
		
		 # Display message
		li $v0, 4
		la $a0, message
		syscall
		
		# Read user's input
		li $v0, 6 # it will be stored in $f0
		syscall
		
		# Display value
		li 	$v0, 2
		# Add precision 1
		add.s	$f12, $f0, $f4
		syscall 