.model tiny
.data
fileName db "l4task1.txt", 0
dat1 db 112 dup('$')
dataCnt equ 111
handle dw ?
.code
.startup
    ;opening existing file <l4task1.txt> with RD permission
    mov ah,3dh
    mov al,00h
    lea dx,fileName
    int 21h
    mov handle,ax

    ;reading file l4task1.txt
    mov ah,3fh
    mov bx,handle
    mov cx,dataCnt
    lea dx,dat1
    int 21h

    ;displaying data on DOSBOX
    lea dx,dat1
    mov ah,09h
    int 21h

    ;closing l4task1.txt
    mov ah,3eh
    mov bx,handle
    int 21h
.exit
end


