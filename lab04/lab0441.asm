public	x
extrn	exit: far

sstk	segment	para stack 'stack'
		db 100 dup(0)
sstk	ends

sd1	segment	para public 'data'
	x	db 'X'
sd1	ends

sc1	segment	para public 'code'
assume	cs:sc1, ds:sd1
main:
	jmp	exit
sc1	ends
end main
