	.data
		myCharacter: .byte 'm'
		mySecondCharacter: .byte 'c'
	.text
		li $v0, 4
		la $a0, myCharacter
		la $a1, mySecondCharacter
		syscall