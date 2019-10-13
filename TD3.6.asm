.data
	espace:		.asciiz		" "
.text
	li		$s0		0
	la		$a2		0x10010000
	sw		$t0		$v1($a2)
	
	lw		$t6		$s0($a2)
	

	li		$v0		1
	syscall
	