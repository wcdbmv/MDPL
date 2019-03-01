extrn	output_x: near

stk	segment	para stack 'stack'
		db 100 dup(0)
stk	ends

dseg	segment	para public 'data'
	x	db 'R'
dseg	ends

cseg	segment	para public 'code'
assume	cs:cseg, ds:dseg, ss:stk
main:
	mov	ax,dseg
	mov	ds,ax

	call	output_x

	mov	ax,4c00h
	int	21h
cseg	ends

public	x

end	main
