public	print_sbin

extrn	print_ubin:near

cseg	segment public
assume	cs:cseg

print_sbin	proc	near
	push	bp
	mov	bp, sp

	mov	bx, [bp + 0004h]

	cmp	bx, 0000h
	jns	_print_sbin_skip_neg

	mov	ah, 02h
	mov	dl, '-'
	int	21h

	neg	bx

 _print_sbin_skip_neg:
	push	bx
	call	print_ubin

	pop	bp
	ret	02h
print_sbin	endp

cseg	ends
end
