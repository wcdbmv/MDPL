.386
.model FLAT, c
.listall

include create_function.txt

PUBLIC MACRO_MAIN

.code
MACRO_MAIN proc near
	create_function sum, int, <x, y>, <ECX, EDX>
	ret
MACRO_MAIN endp

END
