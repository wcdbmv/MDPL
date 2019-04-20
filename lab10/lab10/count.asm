.386
.model flat, c

public	count

.code
count:
	push	ebp
	push	esi
	mov		ebp, esp
	mov		esi, [ebp + 12] ; x
	mov		ecx, [ebp + 16]	; l
	
    xor		eax, eax
    xor		edx, edx

	mov		ebx, [esi]
	
mainloop:
	bt		ebx, edx ; cf = ebx[edx]
	jnc		zero
	inc		eax

zero:
	inc		edx
	cmp		edx, 32
	jnz		continue
	xor		edx, edx
	add		esi, 4
	mov		ebx, [esi]

continue:
	loop	mainloop

	pop		esi
	pop		ebp
	ret
end