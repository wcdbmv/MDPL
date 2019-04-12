.386
.model flat, c
public p1
.code

p1:
	push ebp
	mov  ebp, esp
	mov  ecx, [ebp + 8]
	mov  ebx, [ebp + 12]

	cmp  ecx,1
	jz   m1

	dec  ecx
	push ebx
	push ecx
	call p1
	add  esp, 8

	mov  ecx, [ebp + 8]
	mov  eax, [ebx]
	mul  ecx
	mov  [ebx], eax
	jmp  m2

m1:
	mov  eax, 1
	mov  [ebx], eax

m2:
	pop  ebp
	ret

end
