
	BITS    64
	GLOBAL  memcpy:function
memcpy:
	PUSH    RBP
	MOV     RBP, RSP
	XOR     RAX, RAX
	XOR     RCX, RCX
	CMP     RDX, 0
	JZ      return_0

loop:
	CMP     RCX, RDX
	MOV     R8B, [RSI + RCX]
	JE      end
	MOV     BYTE[RDI + RCX], R8B
	inc     RCX
	JMP     loop
end:
	XOR     RAX, RDI
	XOR     RCX, RCX
	LEAVE
		RET

return_0:
	XOR     RAX, RAX
	XOR     RCX, RCX
	LEAVE
		RET
	
