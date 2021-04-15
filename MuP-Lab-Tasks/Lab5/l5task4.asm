.model tiny
.486
.data

currMode db ?

rowStart1 dw 0
colStart1 dw 0
rowEnd1 dw 250
colEnd1 dw 150

rowStart2 dw 20
colStart2 dw 20
rowEnd2 dw 230
colEnd2 dw 130

rowStart3 dw 40
colStart3 dw 40
rowEnd3 dw 210
colEnd3 dw 110

rowStart4 dw 60
colStart4 dw 60
rowEnd4 dw 190
colEnd4 dw 90

rowStart5 dw 70
colStart5 dw 70
rowEnd5 dw 180
colEnd5 dw 80

rowStart6 dw 72
colStart6 dw 72
rowEnd6 dw 178
colEnd6 dw 78

redColor db 04h; 00000100b
grnColor db 02h; 00000010b

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

    ; display rectangle of 150*250 from (0, 0)
    mov dx, rowStart1
x2: mov cx, colStart1
x1: mov al, redColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd1
    jnz x1
    inc dx
    cmp dx, rowEnd1
    jnz x2

    ; display rectangle of 110*210 from (20, 20)
    mov dx, rowStart2
x4: mov cx, colStart2
x3: mov al, grnColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd2
    jnz x3
    inc dx
    cmp dx, rowEnd2
    jnz x4

    ; display rectangle of 70*170 from (40, 40)
    mov dx, rowStart3
x6: mov cx, colStart3
x5: mov al, redColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd3
    jnz x5
    inc dx
    cmp dx, rowEnd3
    jnz x6

    ; display rectangle of 30*130 from (60, 60)
    mov dx, rowStart4
x8: mov cx, colStart4
x7: mov al, grnColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd4
    jnz x7
    inc dx
    cmp dx, rowEnd4
    jnz x8

    ; display rectangle of 10*110 from (70, 70)
    mov dx, rowStart5
x10:mov cx, colStart5
x9: mov al, redColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd5
    jnz x9
    inc dx
    cmp dx, rowEnd5
    jnz x10

    ; display rectangle of 6*106 from (72, 72)
    mov dx, rowStart6
x12:mov cx, colStart6
x11:mov al, redColor
    mov ah, 0ch
    int 10h
    inc cx
    cmp cx, colEnd6
    jnz x11
    inc dx
    cmp dx, rowEnd6
    jnz x12

    ; blocking function '#'
x13:mov ah, 07h
    int 21h
    cmp al, '#'
    jnz x13

    ; restoring original mode
    mov al, currMode
    mov ah, 00h
    int 21h
.exit
end