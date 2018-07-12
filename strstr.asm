        BITS	64
	GLOBAL	strstr:function
strstr:
	push	RBP
	mov	RBP, RSP
	xor	RAX, RAX
	xor	RCX, RCX
	
loop:
	cmp	BYTE[RSI + RAX], 0
	je	end_success		; reussite
	cmp	BYTE[RDI + RCX], 0
	je	end_fail		; fail
	mov	r8b, BYTE[RSI + RAX]
	cmp	BYTE[RDI + RCX], r8b ; cmp des caractères
	je	find		     ; incrémentation
	xor	RAX, RAX
	inc	RCX
	jmp	loop

end_success:
	mov	r8, RAX
	mov	RAX, RDI
	ADD	RAX, RCX
	SUB	RAX, r8

	LEAVE
	ret

end_fail:
	mov	RAX, 0
	LEAVE
		ret

find:
	INC	RAX
	INC	RCX
	jmp	loop
