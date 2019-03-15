extrn	x: byte
public	exit

sd2	segment	para 'data'
	y	db 'Y'
sd2	ends

sc2	segment	para public 'code'
assume	cs:sc2, ds:sd2
exit:
	mov	ax, seg x
	mov	es, ax

	mov	ax, sd2
	mov	ds, ax

	xchg	al, y
	xchg	al, es:x
	xchg	al, y

	mov	dl, y
	mov	ah, 2h
	int	21h
	
	mov	ah, 4ch
	int	21h
sc2	ends
end
