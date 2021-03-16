.model tiny
.data
exm4 dw 43 dup(?)
exm5 dw 43 dup(?)
rohit db ?
.code
.startup
    lea si,exm4
    lea di,exm5
    mov cl,43
    mov ch,00   ;stores the overflow count
x1: mov dl,0    ;moving 0 to dl
    inc dl  ;incrementing dl by 0 to 1, whch makes OF = 0
x2: mov ax,[si] 
    add [di],ax
    jno x1
    inc ch
    add si,02h
    add di,02h
    dec cl
    jnz x2
    mov rohit,ch
.exit
end

