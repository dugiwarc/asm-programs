.data
	myArray: 	.space		12		# 12 bytes
	newLine: 	.asciiz		"\n"
.text
	main:
		addi	$s0, $zero, 4
		addi	$s1, $zero, 10
		addi	$s2, $zero, 12
	
		# Index = $t0
		addi $t0, $zero, 0
	
		# Store word
		# Store items one by one
		# Store $s0 into myArray@position $t0
		sw 	$s0, myArray($t0)
			# Update offset/index
			addi	$t0, $t0, 4
			
		sw	$s1, myArray($t0)
			# Update offset/index
			addi	$t0, $t0, 4
			
		sw	$s2, myArray($t0)
	
		# Set $t0 to 0
		addi	$t0, $zero, 0
	
		while:
			beq	$t0, 12, exit
			
			# Load into $t6 from myArray@position $t0
			lw	$t6, myArray($t0)
		
			# Increment index by a word's worth
			addi	$t0, $t0, 4
		
			# Display the value to the screen
			li	$v0, 1
			move	$a0, $t6
			syscall
		
			# Print a new line
			li	$v0, 4
			la 	$a0, newLine
			syscall
		
			j while
		exit:
			# End of program
			li	$v0, 10
			syscall
