public	print_shex

extrn	print_uhex:near

cseg	segment	public
assume	cs:cseg

print_shex	proc	near
	push	bp
	mov	bp, sp

	mov	bx, [bp + 0004h]

	cmp	bx, 0000h
	jns	_print_shex_skip_neg

	mov	ah, 02h
	mov	dl, '-'
	int	21h

	neg	bx

 _print_shex_skip_neg:
	push	bx
	call	print_uhex

	pop	bp
	ret	02h
print_shex	endp

cseg	ends
end
