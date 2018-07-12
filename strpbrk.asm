	BITS 64
	GLOBAL strpbrk:function

strpbrk:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX
	XOR	RCX, RCX
	XOR	R8, R8
	
loop:
	CMP	BYTE[RDI + RAX], 0
	JE	end_fail
	XOR	RCX, RCX
	INC	RAX
	JMP	enter_loop

enter_loop:
	CMP	BYTE[RSI + RCX], 0
	JE	loop
	MOV	R9B, [RDI + RAX - 1]
	CMP	BYTE[RSI + RCX], R9B
	JE	end
	INC	RCX
	JMP	enter_loop
	
end_fail:
	MOV	RAX, 0
	LEAVE
		RET

end:
	SUB	RAX, 1
	ADD	RAX, RDI
	LEAVE
		RET
