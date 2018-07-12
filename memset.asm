
	BITS	64
	GLOBAL	memset:function

memset:
	PUSH 	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX
	XOR	RCX, RCX
	CMP	RDX, 0
	JZ	return_0
	MOV	R9 , 0
	MOV	R9, RSI
loop:
	CMP	RCX, RDX
	JZ	end
	MOV	BYTE[RDI + RCX], R9B
	inc	RCX
	JMP	loop
end:
	MOV	RAX, RDI
	XOR	RCX, RCX
	LEAVE
		RET
	
return_0:
	XOR	RAX, RAX
	XOR	RCX, RCX
	LEAVE
		RET
