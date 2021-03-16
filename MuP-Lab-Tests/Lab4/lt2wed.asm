.model tiny
.486
.data
strmax db 10
stract db ?
strdata db 10 dup('$')

disp1 db "Enter string:", 0dh, 0ah, '$'
disp2 db 0dh, 0ah, "Output:", 0dh, 0ah, '$'
.code
.startup
    lea dx,disp1
    mov ah,09h
    int 21h

    lea dx,strmax
    mov ah,0ah
    int 21h

    lea dx,disp2
    mov ah,09h
    int 21h

    lea si,strdata
    mov cl,stract
    mov ch,0
x2: mov al,[si]
    cmp al,'R'
    jne x1
    inc ch
x1: inc si
    dec cl
    jnz x2

    add ch,30h
    mov dl,ch
    mov ah,02h
    int 21h
.exit
end
