.386
.model flat, c
public p2
.code

p2:
	push ebp
	mov  ebp, esp
	mov  ecx, [ebp + 8]
	mov  ebx, [ebp + 12]

	mov  eax, 1
	call m3

	mov  [ebx], eax
	pop  ebp
	ret

m3:
	cmp  ecx, 1
	jz   exit
	mul  ecx
	dec  ecx
	call m3

exit:
	ret

end
