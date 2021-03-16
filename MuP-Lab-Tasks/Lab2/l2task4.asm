.model tiny
.data
array1 dw 5e7fh, 1234h, 95abh, 0f437h, 3a89h
count db 5
neg1 db ?
.code
.startup
    lea si,array1
    mov cl,count
    mov ch,00
x2: mov ax,[si]
    rol ax,1
    jnc x1
    inc ch
x1: inc si
    dec cl
    jnz x2
    mov neg1,ch
.exit
end


