sd1	segment	para public 'data'
	s1	db 'Y'
		db 65535 - 2 dup(0)
sd1	ends

sd2	segment	para public 'data'
	s2	db 'E'
		db 65535 - 2 dup(0)
sd2	ends

sd3	segment	para public 'data'
	s3	db 'S'
		db 65535 - 2 dup(0)
sd3	ends

cseg	segment	para public 'code'
assume	cs:cseg, ds:sd1
output:	mov	ah, 2
	int	21h
	mov	dl, 13
	int	21h
	mov	dl, 10
	int	21h
	ret
main:
	mov	ax, sd1
	mov	ds, ax
	mov	dl, s1
	call	output
assume	ds:sd2
	mov	ax, sd2
	mov	ds, ax
	mov	dl, s2
	call	output
assume	ds:sd3
	mov	ax, sd3
	mov	ds, ax
	mov	dl, s3
	call	output
	mov	ah, 4ch
	int	21h
cseg	ends
end	main
