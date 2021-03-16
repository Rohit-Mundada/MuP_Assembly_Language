.model tiny
.data
exm3 dw 002bh, 002bh, 002bh, 0056h, 0012h, 0011h, 000ah, 0034h, 0078h, 0099h, 0065h, 0041h, 00f1h, 0012h, 0023h, 00dch, 00cbh, 00bah, 00a9h, 000eh, 003fh, 001dh, 0001h, 00b1h, 0043h, 0032h, 0021h, 001fh, 00feh, 00edh
mund db ?
.code
.startup
    lea si,exm3
    mov cl,30
    mov ch,00
    mov bl,43
x2: mov ax,[si]
    div bl
    cmp ah,00h
    jne x1
    inc ch
x1: add si,02h
    dec cl
    jnz x2
    mov mund,ch
.exit
end
