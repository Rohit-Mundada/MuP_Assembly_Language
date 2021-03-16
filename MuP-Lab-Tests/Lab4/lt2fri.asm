.model tiny
.data

strcnt db 6
strdata db 6 dup('$')

newline db 0dh, 0ah, '$'

.code
.startup
    ;get data byte by byte without echo
    lea si,strdata
    mov cl,strcnt
x1: mov ah,08h
    int 21h
    mov [si],al
    inc si
    dec cl
    jnz x1

    ;increment data bytes by 1
    lea si,strdata
    mov cl,strcnt
x2: mov al,[si]
    inc al
    mov [si],al
    inc si
    dec cl
    jnz x2

    ;go to new line
    lea dx,newline
    mov ah,09h
    int 21h

    ;display string
    lea dx,strdata
    mov ah,09h
    int 21h
.exit
end