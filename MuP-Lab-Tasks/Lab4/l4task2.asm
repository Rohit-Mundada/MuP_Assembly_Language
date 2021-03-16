.model tiny
.data
fileName db "l4task1.txt", 0
hostelRn db "Hostel Name: DH2, Room No: 326R"
handle dw ?
.code
.startup
    ;opening existing file <l4task1.txt> with WR/RD permission
    mov ah,3dh
    mov al,02h
    lea dx,fileName
    int 21h
    mov handle,ax

    ;moving file pointer to end of file
    mov ah,42h
    mov al,02h
    mov bx,handle
    mov cx,0000h
    mov dx,0000h
    int 21h

    ;appending hostelRn data to l4task1.txt
    mov ah,40h
    mov bx,handle
    mov cx,31
    lea dx,hostelRn
    int 21h

    ;closing l4task1.txt
    mov ah,3eh
    mov bx,handle
    int 21h
.exit
end



