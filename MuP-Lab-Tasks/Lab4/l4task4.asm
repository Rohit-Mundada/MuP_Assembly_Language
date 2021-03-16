.model tiny
.data
fileName db "l4task1.txt", 0
dat1 db 112 dup('$')
handle dw ?
.code
.startup
    ;opening existing file <l4task1.txt> with RD permission
    mov ah,3dh
    mov al,00h
    lea dx,fileName
    int 21h
    mov handle,ax

    ;reading file l4task1.txt byte-by-byte
    mov ah,42h
    mov al,02h  ;relative to end of file
    mov bx,handle
    mov cx,0f000h   ;gving -ve value to cx, so pointer will move backwards
x1: mov ah,3fh
    dec cx  ;decreasing cx by one, to read 1 byte of data at a time
    lea dx,dat1
    int 21h
    cmp ax,cx
    jae x1

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





