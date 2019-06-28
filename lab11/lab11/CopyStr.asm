.386
.model flat, c

public CopyStr

.code
CopyStr proc
	push ebp
	mov  ebp, esp

	push esi
	push edi

	mov  ecx, [ebp + 16] ; l
	mov  edi, [ebp + 12] ; &dst
	mov  esi, [ebp + 8]  ; &src
	inc  ecx

	cld
	cmp  esi, edi
	jz   exit
	jg   mainloop

	std
	add esi, ecx
	add edi, ecx

mainloop:
	rep movsb

exit:
	mov  eax, edi

	pop  edi
	pop  esi
	pop  ebp

	ret

CopyStr endp
end
