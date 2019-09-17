	.data
	
	.text
	
	
		main:
		
		li $s0, 10
		li $s1, 5
		
		# s2 = s0 + s1
		add $s2, $s0, $s1
		xor $s2, $s2, $s2
		
		# s2 = s1 - s0
		sub $s2, $s1, $s0
	
		exit: