.model tiny
.data

strmax db 21
stract db ?
strdata db 22 dup('$')

newline db 0dh, 0ah, '$'

.code
.startup
    ;get 20 letter string
    lea dx,strmax
    mov ah,0ah
    int 21h

    ;go to new line
    lea dx,newline
    mov ah,09h
    int 21h

    ;display the entered string
    mov cl,stract
    lea si,strdata
x1: mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    dec cl
    jnz x1
.exit
end