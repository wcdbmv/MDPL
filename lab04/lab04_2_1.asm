stk	segment para stack 'stack'
		db 100 dup(0)
stk	ends

sd1	segment	para common 'data'
	w	dw 3444h
sd1	ends
end
