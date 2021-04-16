.model tiny
.486
.data

currMode db ?

fileName db "mon.txt", 0
handle dw ?
fileData db 107 dup('$')
dataCnt equ 106

blue equ 01h ; 0000 0001
green equ 02h ; 0000 0010
cyan equ 03h ; 0000 0011
red equ 04h ; 0000 0100
magenta equ 05h ; 0000 0101
brown equ 06h ; 0000 0110
white equ 07h ; 0000 0111

.code
.startup
    ; open mon.txt with RD permission
    mov ah, 3dh
    mov al, 00h
    lea dx, fileName
    int 21h
    mov handle, ax

    ; read from file
    mov ah,3fh
    mov bx,handle
    mov cx,dataCnt
    lea dx,fileData
    int 21h

    ; get current display mode
    mov ah, 0fh
    int 10h
    mov currMode, al

    ; set text mode 3
    mov ah, 00h
    mov al, 03h
    int 10h

    ; read a number without echo
    mov ah, 08h
    int 21h

    ; set attribute
    cmp al, '1'
    jne x1
    mov bl, blue
x1: cmp al, '2'
    jne x2
    mov bl, green
x2: cmp al, '3'
    jne x3
    mov bl, cyan
x3: cmp al, '4'
    jne x4
    mov bl, red
x4: cmp al, '5'
    jne x5
    mov bl, magenta
x5: cmp al, '6'
    jne x6
    mov bl, brown
x6: cmp al, '7'
    jne x7
    mov bl, white
x7: cmp al, '@'
    jz x8

    ; set cursor position to (0, 0)
    mov ah, 02h
    mov dh, 0
    mov dl, 0
    mov bh, 00h
    int 10h

    ; write character
    mov ah, 09h
    lea si, fileData
    add si, 06
    mov al, [si]
    mov cx, 01h
    int 10h

    ; set cursor position to (79, 23)
    mov ah, 02h
    mov dh, 23
    mov dl, 79
    int 10h

    ; write character
    mov ah, 09h
    add si, 06
    mov al, [si]
    mov cx, 01h
    int 10h

    ;closing mon.txt
    mov ah,3eh
    mov bx,handle
    int 21h

    ; restoring original mode
x8: mov al, currMode
    mov ah, 00h
    int 10h
.exit
end


    










    

