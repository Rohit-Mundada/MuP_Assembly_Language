.model tiny
.386
.data
org 0000h
array1 dd 11111111h, 22222222h, 33333333h, 44444444h, 55555555h, 66666666h, 77777777h, 88888888h, 99999999h, 0aaaaaaaah
org 0014h
array2 dd ?
.code
.startup
    lea si,array1
    lea di,array2
    add si,36
    add di,36
    mov cl,10
x1: mov eax,[si]
    mov [di],eax
    sub si,04
    sub di,04
    dec cl
    jnz x1
.exit
end


