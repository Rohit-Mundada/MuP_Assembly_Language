.model tiny
.data
sttr db 'ahbJoJUQKAlrinApKssladalLNbVZR'
.code
.startup
    lea si,sttr
    mov cl,30
    mov ah,'a'
x1: cmp ah,[si]
    jna x1
    mov al,[si]
    sub al,ah
    mov bl,[si]
    sub bl,32
    add bl,al
    mov [si],bl
x1: inc si
    dec cl
    jnz x2
.exit
end