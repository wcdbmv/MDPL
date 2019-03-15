dseg	segment	para public 'data'
	x	db 1, 2, 3, 4, 5
		db 1, 2, 3, 4, 5
		db 1, 2, 3, 4, 5
		db 1, 2, 3, 4, 5
		db 1, 2, 3, 4, 5
dseg ends

cseg	segment	para public 'code'
assume	cs:cseg, ds:dseg
main:	mov	ax, dseg
	mov	ds, ax

	mov	bx, offset x
	mov	cx, 4

m1:	mov	ax, cx
	mov	di, 5
	mov	si, 1

m2:	xchg	dh, [bx][si]
	xchg	dh, [bx][di]
	xchg	dh, [bx][si]

	add	di, 5
	inc	si
	loop	m2

	add	bx, 6
	mov	cx, ax
	loop	m1

	mov	ah, 4ch
	int	21h
cseg	ends
end	main
