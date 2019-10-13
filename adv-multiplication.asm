	.data
	
	.text
		addi $t0, $zero, 2000
		addi $t1, $zero, 10
		
		# stores result in lo
		mult $t0, $t1
		
		# moves from flo (mflo) to $s0
		mflo $s0
		
		li $v0, 1
		add $a0, $zero, $s0
		syscall