
	BITS    64
	GLOBAL  strncmp:function

strncmp:
	PUSH    RBP
	MOV     RBP, RSP
	XOR     RAX, RAX
	XOR     R9, R9
	XOR     R10, R10
	CMP	RDX, 0
	JE	equal
loop:
	CMP	RDX, 0
	JE	equal
	MOV     R9B, [RDI + RAX]
	MOV     R10B, [RSI + RAX]
	CMP     R9B, R10B
	JA      above
	JB      below
	CMP	R9B, 0
	JZ	test_equal
	INC     RAX
	DEC	RDX
	JMP     loop

test_equal:
	CMP	R10B, 0
	JZ	equal
	JMP	below

equal:
	MOV	RAX, 0
	LEAVE
	RET
above:
	MOV     RAX, R9
	SUB	RAX, R10
	LEAVE
	RET
below:
	MOV     RAX, R9
	SUB	RAX, R10
	LEAVE
	RET
	
