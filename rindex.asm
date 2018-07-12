        BITS 64
	global  rindex:function
	section .text

rindex:
	PUSH    RBP
	MOV     RBP, RSP

	XOR     RCX, RCX
	XOR     RAX, RAX
	XOR     R8, R8
	XOR	R10, R10
	LEA	R10, [RDI + RCX]	
	MOV	R8, RSI
	CMP	RDI, 0
	JE	end
count:
	CMP	BYTE[RDI + RCX], 0
	JZ	store_end
	CMP	BYTE[RDI + RCX], R8B
	JE	store
	INC	RCX
	JMP	count

end:
	MOV RAX, R10
	LEAVE
	RET

store:
	XOR R10, R10
	LEA R10, [RDI + RCX]
	INC RCX
	JMP count
	
store_end:
	XOR R10, R10
	LEA R10, [RDI + RCX]
	INC RCX
	JMP end
