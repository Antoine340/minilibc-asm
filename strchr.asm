
	BITS 64
	GLOBAL strchr:function

strchr:
	push    RBP
	mov     RBP, RSP
	XOR	RAX, RAX
	XOR	RCX, RCX
	CMP	RDI, 0
	JZ	error
	XOR	R9, R9
	MOV	R9, RSI

loop:
	CMP	BYTE[RDI + RCX], R9B
	JZ	end
	CMP	BYTE[RDI + RCX], 0
	JZ	error
	INC	RCX
	JMP	loop

error:
	XOR	RAX, RAX
	XOR	RCX, RCX
	LEAVE
	        ret
end:
	MOV	RAX, RDI
	ADD	RAX, RCX
	XOR	RCX, RCX
	LEAVE
	        ret

	
