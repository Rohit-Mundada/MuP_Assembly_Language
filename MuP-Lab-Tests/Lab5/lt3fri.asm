.model tiny
.data
fileName db "p6f.txt", 0

handle dw ?

nameMax db 12
nameAct db ?
nameData db 13 dup('$')
.code
.startup
    ;get name
    lea dx,nameMax
    mov ah,0ah
    int 21h

    ;changing format to ASCIZ
    lea si,nameData
	mov cl,nameAct
    mov ch,00
	add si,cx
	sub nameAct,1
	mov bl,0
	mov [si],bl

    ;change file name
    mov ah,56h
    lea dx,fileName
    lea di,nameData
    int 21h
.exit
end




