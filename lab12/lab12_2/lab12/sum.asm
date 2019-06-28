.386
.model FLAT, c
.listall

PUBLIC sum

.code
	A = 1
	B = 0
	D = 0

sum:
	push EBP
	mov EBP, ESP

	PUSH ECX
	QQ1 EQU ECX
	A = A + 1
	USH EDX
	QQ2 EQU EDX
	A = A + 1

	A = A - 1
	B = A

	D = 8
	x textequ @catstr(<[ebp + %D]>)
	D = D + 4
	y textequ @catstr(<[ebp + %D]>)
	D = D + 4

	mov eax, x
	add eax, y

	pop EDX
	B = B - 1
	pop ECX
	B = B - 1

	pop EBP
	ret
END
