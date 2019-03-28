extrn	print_ubin:near
extrn	print_sbin:near
extrn	print_udec:near
extrn	print_sdec:near
extrn	print_uhex:near
extrn	print_shex:near

sseg	segment	stack
	db	64 dup (?)
sseg	ends

dseg	segment	public
	print	dw print_ubin, print_sbin, print_udec, print_sdec, print_uhex, print_shex
	n	dw 5
	menu	db '---- menu -----------', 0ah, 0dh
		db '0. print menu',         0ah, 0dh
		db '1. input number',       0ah, 0dh
		db '2. print unsigned bin', 0ah, 0dh
		db '3. print   signed bin', 0ah, 0dh
		db '4. print unsigned dec', 0ah, 0dh
		db '5. print   signed dec', 0ah, 0dh
		db '6. print unsigned hex', 0ah, 0dh
		db '7. print   signed hex', 0ah, 0dh
		db '8. exit',               0ah, 0dh
		db '$'
	command_prompt	db 'command> ', '$'
	number_prompt	db 'number> ',  '$'
dseg	ends

cseg	segment public
assume	cs:cseg, ds:dseg, ss:sseg

main:
	mov	ax, dseg
	mov	ds, ax

print_menu:
	mov	ah, 09h
	mov	dx, offset menu
	int	21h

print_command_prompt:
	mov	ah, 09h
	mov	dx, offset command_prompt
	int	21h

input_command:
	mov	ah, 08h
	int	21h

	cmp	al, '8'
	ja	input_command

	cmp	al, '0'
	jb	input_command

	mov	ah, 02h
	mov	dl, al
	int	21h
	
	mov	bl, al
	call	print_nl

switch:
	cmp	bl, '0'
	jz	print_menu

	cmp	bl, '1'
	jz	input_number

	cmp	bl, '8'
	jz	exit

	sub	bl, '2'
	shl	bl, 01h					; DW adress
	mov	bh, 00h

	mov	ax, n

	push	ax
	call	print[bx]
	call	print_nl

	jmp	print_command_prompt

exit:
	mov	ah, 4ch
	int	21h

input_number:
 _input_number_print_prompt:
	mov	ah, 09h
	mov	dx, offset number_prompt
	int	21h

	mov	bx, 0000h
	mov	cx, 0000h

 _input_number_read_char:
	mov	ah, 08h
	int	21h

	cmp	al, 0dh
	jz	_input_number_end_read

	cmp	al, '-'
	jz	_input_number_negative

	cmp	al, '0'
	jb	_input_number_read_char

	cmp	al, '9'
	ja	_input_number_read_char

	mov	ah, 02h
	mov	dl, al
	int	21h

	mov	cl, al
	mov	ax, bx

	shl	ax, 01h					; mul 10
	shl	ax, 01h
	add	ax, bx
	shl	ax, 01h

	mov	bl, cl
	sub	bl, '0'
	mov	bh, 00h
	add	bx, ax

	jmp	_input_number_read_char

 _input_number_negative:
	mov	ah, 02h
	mov	dl, al
	int	21h

	mov	ch, 01h

	jmp	_input_number_read_char

 _input_number_end_read:
	call	print_nl

	cmp	ch, 01h
	jnz	_input_number_exit

	neg	bx

 _input_number_exit:
	mov	dh, 00h
	mov	dl, ch
	mov	n, bx

	jmp	print_command_prompt

print_nl	proc	near				; overwrites ax = 020dh, dl = 0dh
	mov	ah, 02h
	mov	dl, 0ah
	int	21h
	mov	dl, 0dh
	ret
print_nl	endp

cseg	ends
end	main
