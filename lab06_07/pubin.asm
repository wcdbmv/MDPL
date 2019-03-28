public	print_ubin

cseg	segment	public
assume	cs:cseg

print_ubin	proc	near
	push	bp
	mov	bp, sp

	mov	bx, [bp + 0004h]
	mov	cx, 0010h			; max bits

 _UB1:						; delete all leading zeros on the left in _UB1 and _UB2
	mov	dl, '0'

	shl	bx, 01h
	jnc	_UB2

	mov	dl, '1'

	jmp	_UB4

 _UB2:
	loop	_UB1
	mov	cx, 0001h

 _UB3:
	mov	dl, '0'

	shl	bx, 01h
	jnc	_UB4

	mov	dl, '1'

 _UB4:
	mov	ah, 02h
	int	21h

	dec	cx
	cmp	cx, 0000h
	ja	_UB3

 _UB5:
	pop	bp
	ret	02h
print_ubin	endp

cseg	ends
end
