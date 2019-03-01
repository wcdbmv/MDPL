public	output_x
extrn	x: byte

ds2	segment	at 0b800h
	ca	label byte
	org	80 * 2 * 2 + 1 * 2
	symb	label word
ds2	ends

cseg	segment	para public 'code'
assume	cs:cseg, es:ds2
output_x proc near
	mov	ax, ds2
	mov	es, ax
	mov	ah, 10
	mov	al, x
	mov	symb, ax
	mov	al, '0'
	mov	ca, al
	ret
output_x endp
cseg	ends
end
