.386
.model flat, c

public setcler

.code
setcler:
    push ebp
    mov  ebp, esp
    mov  eax, [ebp + 12] ; n

    xor  edx, edx
    mov  ebx, 32
    div  ebx
    shl  eax, 4

    mov  ebx, [ebp + 8]  ; &x

    add  ebx, eax

    mov  ecx, [ebp + 16] ; p

    cmp  ecx, 0
    jz   reset
    bts  [ebx], edx
    jmp  exit

reset:
    btr  [ebx], edx

exit:
    pop  ebp
    ret
end
