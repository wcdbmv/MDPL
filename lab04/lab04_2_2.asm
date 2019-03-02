sd1	segment	para common 'data'
	c1	label byte
	org	1h
	c2	label byte
sd1	ends

cseg	segment	para 'code'
assume	cs:cseg, ds:sd1
main:
	mov	ax, sd1
	mov	ds, ax
	mov	ah, 2h
	mov	dl, c1
	int	21h
	mov	dl, c2
	int	21h
	mov	ax, 4c00h
	int	21h
cseg	ends
end main
