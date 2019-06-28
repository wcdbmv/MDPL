.386
.model flat, c

public DelProbel

.code
DelProbel proc
	push ebp
	mov  ebp, esp

	mov  ebx, [ebp + 8]
	mov  ecx, 0FFFFFFFFh
	cld

; find_first_non_whitespace
	mov  edi, ebx
	mov  al, ' '
	repe scasb
	dec  edi
	mov  esi, edi                       ; first non-whitespace
	mov  edx, edi                       ; last  non-whitespace

	cmp  BYTE PTR [esi], 0              ; in case string is completely filled with whitespaces
	jnz  find_last_non_whitespace
	xor  eax, eax
	mov  edi, ebx
	jmp  terminate

find_last_non_whitespace:             ; scasb problematic to use
	inc  edi
	cmp  BYTE PTR [edi], 0
	jz   strip
	cmp  BYTE PTR [edi], ' '
	jz   find_last_non_whitespace
	mov  edx, edi
	jmp  find_last_non_whitespace

strip:
	mov  edi, ebx                       ; now edi is pointer to first char
	mov  ecx, edx                       ; now ecx is pointer to last non-whitespace char
	sub  ecx, esi                       ; now ecx is distance between first and last non-whitespace chars
	inc  ecx                            ; now ecx is length of result string
	mov  eax, ecx                       ; eax is return value (length)
	rep  movsb                          ; copy ds:[esi] to es:[edi]
terminate:
	mov  BYTE PTR [edi], 0

	pop  ebp
	ret

DelProbel endp
end
