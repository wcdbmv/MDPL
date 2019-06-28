.386
.model flat, c

public DlinaStroki

.code
DlinaStroki proc
	push ebp
	mov  ebp, esp

	mov  edi, [ebp + 8]

	mov  ecx, 0FFFFFFFFh
	xor  eax, eax

	repne scasb

	sub  eax, ecx            ; magic
	sub  eax, 2

	pop ebp
	ret

DlinaStroki endp
end














; PREVIOUS VERSION
;
;
;.code
;DlinaStroki proc
;	push ebp
;	mov  ebp, esp
;	mov  ebx, [ebp + 8]
;
;	xor  eax, eax
;
;mainloop:
;	mov  dl, [ebx + eax]
;	test dl, dl
;	jz   exit
;	inc  eax
;	jmp  mainloop
;
;exit:
;	pop  ebp
;	ret
;
;DlinaStroki endp
;end
