.model tiny
.data
fileName db "l4task5.txt", 0

nameMax db 14
nameAct db ?
nameData db 14 dup('$')

newLine db 0dh, 0ah, '$'

idMax db 14
idAct db ?
idData db 14 dup("$")

handle dw ?
.code
.startup
    ;get name
    lea dx,nameMax
    mov ah,0ah
    int 21h

    ;go to new line
    lea dx,newLine
    mov ah,09h
    int 21h

    ;get id
    lea dx,idMax
    mov ah,0ah
    int 21h

    ;create file l4task5.txt
    mov ah,3ch
    lea dx,fileName
    mov cl,20h
    int 21h
    mov handle,ax

    ;write name to file
    mov ah,40h
    mov bx,handle
    mov cl,nameAct
    mov ch,00h
    lea dx,nameData
    int 21h

    ;go to new line
    mov ah,40h
    mov bx,handle
    mov cx,02h
    lea dx,newLine
    int 21h

    ;write id to file
    mov ah,40h
    mov bx,handle
    mov cl,idAct
    mov ch,00h
    lea dx,idData
    int 21h

    ;closing l4task5.txt 
    mov ah,3eh
    mov bx,handle
    int 21h
.exit
end



    

