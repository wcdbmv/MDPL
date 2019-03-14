extrn	x: byte
public	exit

sd2	segment	para 'data'
	y	db 'Y'
sd2	ends

sc2	segment	para public 'code'
assume	cs:sc2, ds:sd2
exit:
	mov	ax, sd2
	mov	ds, ax
	mov	ah, y
	
	mov	bx, seg x
	mov	ds, bx
	mov	al, x

	xchg	ah, al

	mov	x, al
	mov	bx, sd2
	mov	ds, bx

	mov	y, ah

	mov	dl, y
	mov	ah, 2
	int	21h

	mov	ah, 4ch
	int	21h
sc2	ends
end
