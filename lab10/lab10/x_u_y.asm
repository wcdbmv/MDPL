.386
.model flat, c

public x_u_y

.code
x_u_y:
    push ebp
    mov  ebp, esp
    mov  eax, [ebp + 8]  ; &x
    mov  ebx, [ebp + 12] ; &y
    mov  ecx, [ebp + 16] ; l

    xor  edx, edx

mainloop:
    bt   [ebx], edx ; cf = [ebx][edx]
    jnc  pass
    bts  [eax], edx

pass:
    inc  edx
    cmp  edx, 32
    jnz  continue
    xor  edx, edx
    add  eax, 4
    add  ebx, 4

continue:
    loop mainloop

    pop  ebp
    ret
end
