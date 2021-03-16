.model tiny
.data
array1 db 12h, 0ah, 7eh, 56h, 0bh, 5dh, 90h, 1fh, 85h, 0ah
.code
.startup
    lea si,array1
    mov cl,10
x2: mov al,[si]
    cmp al,0ah
    jne x1
    mov ah,'E'
    mov [si],ah
x1: inc si
    dec cl
    jnz x2
.exit 
end

