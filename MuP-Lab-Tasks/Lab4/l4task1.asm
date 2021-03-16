.model tiny
.data
fileName db "l4task1.txt", 0
nameId db "Name: Rohit Mundada, ID: 2019AAPS0343G", 0dh, 0ah
handle dw ?
.code
.startup
    ;create file l4task1.txt
    mov ah,3ch
    lea dx,fileName
    mov cl,20h
    int 21h

    ;open l4task1.txt with WR/RD permission
    mov ah,3dh
    mov al,02h
    lea dx,fileName
    int 21h
    mov handle,ax

    ;write nameId twice using loop
    mov si,02h
x1: mov ah,40h
    mov bx,handle
    lea dx,nameId
    mov cx,40
    int 21h
    dec si
    jnz x1

    ;closing l4task1.txt 
    mov ah,3eh
    mov bx,handle
    int 21h
.exit
end


