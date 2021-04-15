.model tiny
.486
.data

currMode db ?
prev db 0

.code
.startup
    ; get current display mode
    mov ah, 0fh
    int 10h
    mov currMode, ah

    ; setting mode 3
    mov ah, 00h
    mov al, 03h
    int 10h

    ; move cursor to row 0 col 0
    mov ah, 02h
    mov dh, 00
    mov dl, 00
    mov bh, 00h
    int 10h

    ; horizontal half screen with blue background and yellow foreground
    mov al, ' '
    mov ah, 09h
    mov bh, 00h
    mov cx, 13*80
    mov bl, 00011110b ; attribute
    int 10h

    ; move cursor to row 13 col 0
    mov ah, 02h
    mov dh, 13
    mov dl, 00
    mov bh, 00h
    int 10h

    ; horizontal half screen with white background and green foreground
    mov al, ' '
    mov ah, 09h
    mov bh, 00h
    mov cx, 13*80
    mov bl, 01110010b ; attribute
    int 10h

    ; move cursor to row 0 col 0
    mov ah, 02h
    mov dh, 00
    mov dl, 00
    mov bh, 00h
    int 10h

    ; take user input without any echo
x4: mov ah, 07h
    int 21h
    cmp al, '#'
    jnz x1
    cmp prev, '$'
    jz x2

x1: mov prev, al
    mov bl, 00011110b ; attribute
    mov bh, 00h
    mov cx, 01h
    mov ah, 09h
    int 10h

    ; move cursor to row 13 col 0
    mov ah, 02h
    mov dh, 13
    int 10h

    mov ah, 09h
    mov bl, 01110010b
    mov cx, 01h
    int 10h

    sub dh, 13
    inc dl
    cmp dl, 80
    jnz x3
    ; if more than 80 columns used then go to next line
    mov dl, 0
    inc dh
    cmp dh, 12
    ; if more than 12 rows used then go to 0th row again
    mov dh, 0

    ; less then 80 columns in a row used and less than 12 rows used
x3: mov ah, 02h
    int 10h
    jmp x4

    ; restoring original mode
x2: mov al, currMode
    mov ah, 00h
    int 10h
.exit
end

    




