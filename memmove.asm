
	BITS	64
	GLOBAL	memmove:function

memmove:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX
	XOR	RCX, RCX
	XOR	R10, R10
	CMP	RDX, 0
	JZ	return_0
	MOV	R10, RDI
	SUB	R10, RSI
	JGE	sub_RDX

loop:
	CMP     RCX, RDX
	JE      end
	MOV     R8B, [RSI + RCX]
	MOV     BYTE[RDI + RCX], R8B
	inc     RCX
	JMP     loop

sub_RDX:
	SUB RDX, 1
inv_loop:
	CMP     RDX, -1
	JE      end
	MOV     R8B, [RSI + RDX]
	MOV     BYTE[RDI + RDX], R8B
	dec     RDX
	JMP     inv_loop
end:
	MOV     RAX, RDI
	XOR     RCX, RCX
	LEAVE
		RET

return_0:
	XOR     RAX, RAX
	XOR     RCX, RCX
	LEAVE
		RET
	
