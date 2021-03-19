.model tiny
.data
strData db 10 dup ('$')
newLine db 0dh, 0ah, '$'
.code
.startup
    ;get 10 characters without echo
    lea si,strData
    mov cl,10
x1: mov ah,08h
    int 21h
    mov [si],al
    inc si
    dec cl
    jnz x1

    ;go to new line
    lea dx,newLine
    mov ah,09h
    int 21h

    ;output string as separate characters
    lea si,strData
    mov cl,10
x2: mov dl,[si]
    mov ah,02h
    int 21h
    lea dx,newLine
    mov ah,09h
    int 21h
    inc si
    dec cl
    jnz x2
.exit
end
    
