public	print_uhex

dseg	segment	public
	table	db '0123456789ABCDEF'
dseg	ends

cseg	segment	public
assume	cs:cseg, ds:dseg

print_uhex	proc	near
	push	bp
	mov	bp, sp

	mov	ax, [bp + 0004h]
	mov	bx, 0000h
	mov	cx, 0004h

 _print_uhex_upload:
	mov	dx, ax
	and	dx, 000fh
	push	dx
	shr	ax, cl
	inc	bx

	cmp	ax, 0000h
	jnz	_print_uhex_upload

	mov	cx, bx
	mov	bx, offset table

 _print_uhex_download:
	pop	ax
	xlat
	mov	dl, al
	mov	ah, 02h
	int	21h
	loop	_print_uhex_download

	pop	bp
	ret	02h
print_uhex	endp

cseg	ends
end
