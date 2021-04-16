.model tiny
.486
.data

currMode db ? 
display db "DOLL"
count dw 4
col db 38

.code
.startup
    ; get current display mode
    mov ah, 0fh
    int 10h
    mov currMode, ah

    ; set text mode 3
    mov ah, 00h
    mov al, 03h
    int 10h

    ; move cursor to center of screen
    ; row = 12, column = col {38, 39, 40, 41}
    lea si, display
    mov di, count
x1: mov ah, 02h
    mov dh, 12
    mov dl, col
    mov bh, 00h
    int 10h

    ; displaying character
    mov ah, 09h
    mov al, [si]
    mov bl, 10000111b ; blinking, background is black, foreground is white
    mov bh, 00h
    mov cx, 01h
    int 10h
    inc si
    inc col
    dec di
    jnz x1

    ; blocking function
x2: mov ah, 08h
    int 21h
    cmp al, '?'
    jne x2

    ; restoring original mode
    mov al, currMode
    mov ah, 00h
    int 10h
.exit
end


