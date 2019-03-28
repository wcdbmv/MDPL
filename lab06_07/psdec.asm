public	print_sdec

extrn	print_udec:near

cseg	segment	public
assume	cs:cseg

print_sdec	proc	near
	push	bp
	mov	bp, sp

	mov	bx, [bp + 0004h]

	cmp	bx, 0000h
	jns	_print_sdec_skip_neg

	mov	ah, 02h
	mov	dl, '-'
	int	21h

	neg	bx

 _print_sdec_skip_neg:
	push	bx
	call	print_udec

	pop	bp
	ret	02h
print_sdec	endp

cseg	ends
end
