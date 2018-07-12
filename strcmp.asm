
	BITS	64
	GLOBAL	strcmp:function

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX
	XOR	R9, R9
	XOR	R10, R10	
loop:
	MOV	R9B, [RDI + RAX]
	MOV	R10B, [RSI + RAX]
	CMP	R9B, R10B
	JNE	sub
	CMP	R9B, 0
	JZ	test_equal
	INC	RAX
	JMP	loop

test_equal:
	CMP	R10B, 0
	JZ	equal
	JMP	sub

equal:
	MOV	RAX, 0
	LEAVE
		RET
sub:
	MOV	RAX, R9
	SUB	RAX, R10
	LEAVE
		RET
