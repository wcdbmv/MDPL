.386
.model	flat, c

public	x_y

.code
x_y:
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp + 8]	; x
	mov		ebx, [ebp + 12]	; y
	mov		ecx, [ebp + 16]	; l

	xor		edx, edx

comp:
	bt		[ebx], edx
	jnc		e_comp

	btr		[eax], edx

e_comp:
	inc		edx
	cmp		edx, 32
	jnz		re_comp

	xor		edx, edx
	add		eax, 4
	add		ebx, 4

re_comp:
	loop	comp

exit:
	pop		ebp
	ret
end
