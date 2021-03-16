.model tiny
.486
.data
dat1s db 8
dat1a db ?
dat1d db 8 dup('$')

disp1 db "Enter string:", 0dh, 0ah, '$'
disp2 db 0dh, 0ah, "Output:", 0dh, 0ah, '$'

.code
.startup
    lea dx,disp1
    mov ah,09h
    int 21h

    lea dx,dat1s
    mov ah,0ah
    int 21h

    lea dx,disp2
    mov ah,09h
    int 21h

    mov cl,dat1a
    lea si,dat1d
x1: mov dl,[si]
    mov ah,02h
    int 21h
    mov dl,' '
    mov ah,02h
    int 21h
    inc si
    dec cl
    jnz x1
.exit
end



