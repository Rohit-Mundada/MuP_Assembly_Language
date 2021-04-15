.model tiny
.486
.data

currMode db ?
rowStart dw 80
colStart dw 70
rowEnd dw 160
colEnd dw 170
redColor db 04h; 00000100b

.code
.startup
    ; get current display mode
    mov ah, 0fh
    int 10h
    mov currMode, ah

    ; set mode 12
    mov ah, 00h
    mov al, 12h
    int 10h

    ; display reactangle of 100*80 from (80, 70)
    mov dx, rowStart
x2: mov cx, colStart
x1: mov al, redColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd
    jnz x1
    inc dx
    cmp dx, rowEnd
    jnz x2

    ; blocking function '#'
x3: mov ah, 07h
    int 21h
    cmp al, '#'
    jnz x3

    ; restoring original mode
    mov al, currMode
    mov ah, 00h
    int 21h
.exit
end



