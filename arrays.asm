.data
	myArray: 	.space		12		# 12 bytes
.text
	addi	$s0, $zero, 4
	addi	$s1, $zero, 10
	addi	$s2, $zero, 12
	
	# Index = $t0
	addi $t0, $zero, 0
	
	# Store word
	sw 	$s0, myArray($t0)
		# Update offset/index
		addi	$t0, $t0, 4
	sw	$s1, myArray($t0)
		# Update offset/index
		addi	$t0, $t0, 4
	sw	$s2, myArray($t0)
		
 	# Load from RAM
 	lw	$t6, myArray($zero)			# Load into $t6
 	
 	li 	$v0, 1
 	addi	$a0, $t6, 0
 	syscall