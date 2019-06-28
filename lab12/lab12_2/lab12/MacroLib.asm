.XALL
.386
.model FLAT, C
PUBLIC m0

Template MACRO type, lname, args, regs

A = 0

	lname&:
		PUSH EBP
		MOV EBP, ESP
FOR arg, <args>
		.LALL
		arg textequ @catstr([EBP + %(8 + A*4)])
		.XALL
		A = A + 1
ENDM
IFB <regs>
		PUSH EBX
		PUSH ESI
		PUSH EDI
ELSE
		B = 1
	FOR reg, <regs>
		PUSH reg
		.LALL
			@catstr(R,%B) textequ <reg>
		.XALL
		B = B + 1
	ENDM
ENDIF
		.LALL
				; code
		.XALL
		
IFB <regs>
		POP EDI
		POP ESI
		POP EBX 
ELSE
		B = B - 1
	WHILE B GT 0
		POP @catstr(R,%B)
		B = B - 1
	ENDM
ENDIF
			
		POP EBP
IFIDN <type>,<INT>
		.LALL
				; MOV EAX, RESULT
		.XALL
ENDIF
IFIDN <type>,<INT*>
		.LALL
				; MOV EAX, OFFSET RESULT
		.XALL
ENDIF
		RET
ENDM
.XALL
.data
.code
m0:
	RET
	Template INT*, func, <x, y, z>, <EAX, EBX>
END