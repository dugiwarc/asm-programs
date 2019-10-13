.data
	myArray: 	.word		100:3
	newLine: 	.asciiz		"\n"
.text
	main:
		# Index = $t0
		addi $t0, $zero, 0
	
		while:
			beq	$t0, 12, exit		# 4bytes * array.length
		
			lw	$t6, myArray($t0)
		
			addi	$t0, $t0, 4
		
			# Print the number
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