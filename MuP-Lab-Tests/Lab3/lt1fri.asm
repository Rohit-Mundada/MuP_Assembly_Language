.model tiny
.data 
str1 db '12345'
str2 db '12345'
str3 db '12345'
equal3 db 00h
.code
.startup
    mov dl,00h
    lea si,str1
    lea di,str2
    mov cx,0005h
    cld
    repe cmpsb
    cmp cx,0
    jnz p1
    inc dl
p1: lea si,str1
    lea di,str3
    mov cx,0
    cld
    repe cmpsb
    cmp cx,0
    jnz p2
    inc dl
p2: lea si,str1
    lea di,str3
    mov cx,0
    cld
    repe cmpsb
    cmp cx,0000h
    jnz p3
    inc dl
p3: cmp dl,01h
    jnz p4
    mov dl,02h
p4: mov equal3,dl     
.exit
end