public	print_udec

cseg	segment	public
assume	cs:cseg

print_udec	proc	near
	push	bp
	mov	bp, sp

	mov	ax, [bp + 0004h]
	mov	bx, 000ah
	mov	cx, 0000h

 _print_udec_upload:
	mov	dx, 0000h
	div	bx
	push	dx
	inc	cx

	cmp	ax, 0000h
	jnz	_print_udec_upload

 _print_udec_download:
	pop	dx
	add	dl, '0'
	mov	ah, 02h
	int	21h
	loop	_print_udec_download

	pop	bp
	ret	02h
print_udec	endp

cseg	ends
end
