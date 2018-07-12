
	BITS 64
	GLOBAL strlen:function

strlen:
	push    RBP
	mov     RBP, RSP
	XOR	RAX, RAX
loop:
	cmp	byte[rdi + rax], 0
	jz	end
	inc	rax
	jmp	loop

end:
	LEAVE
		RET
	
