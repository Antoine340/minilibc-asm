	BITS	64
	GLOBAL	strcasecmp:function

strcasecmp:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX
	XOR	RCX, RCX

loop:
	CMP	BYTE[]
