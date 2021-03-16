.model tiny
.486
.data
; 2 Arrays of 16 byte data are added and result is stored in array2
array1 db 5ah, 29h, 0ah, 79h, 76h, 98h, 0bh, 6fh, 7fh, 2eh, 02h, 08h, 1eh, 14h, 17h, 91h
array2 db 31h, 2bh, 40h, 10h, 7fh, 18h, 24h, 62h, 24h, 87h, 64h, 23h, 3eh, 2dh, 2eh, 90h
.code
.startup
    lea si,array1
    lea di,array2
    mov cl,04h
    mov bl,00
    clc
x1: mov eax,[si]
    adc [di],eax
    add si,04h
    add di,04h
    dec cl
    jnz x1
    jnc x2
    inc bl
x2: mov [di],bl
.exit
end




