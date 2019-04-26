.386
.model flat, c

public begin
extern count: near
extern setcler: near
extern x_u_y: near
extern x_y: near

.data
    s1   dd 00001111000011110000111100001111b, 101010b
    s2   dd 00111100001111000011110000111100b, 100000b

    l    dd 38
    n    dd 33
    p    dd 1

.code
begin:
    push l
    push offset s1
    call count
    add  esp, 8

    push p
    push n
    push offset s1
    call setcler
    add  esp, 12

    push l
    push offset s2
    push offset s1
    call x_u_y
    add  esp, 12

    push l
    push offset s2
    push offset s1
    call x_y
    add  esp, 12

    ret
end
