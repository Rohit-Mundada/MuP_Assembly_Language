.model tiny
.486
.data

currMode db ?

fileName db 'wed.txt', 0
handle dw ? 

disp1 db 'Enter Offset to read from: ', 0dh, 0ah, '$'

inputMax db 3
inputAct db ?
inputDat db 3 dup('$')

num db ?

fileData db 106 dup('$')
count equ 105

magenta db 8dh; 1000 1101
col db 0

.code
.startup
    ;display disp1
    lea dx,disp1
    mov ah,09h
    int 21h

    ;get input
    lea dx,inputMax
    mov ah,0ah
    int 21h

    ; extract number out of input
    lea si, inputDat
    mov al, [si]
    and al, 0fh
    dec al
    mov num, al
    
    ; open file with RD permission
    mov ah,3dh
    mov al,00h
    lea dx,fileName
    int 21h
    mov handle,ax

    ; read from file
    mov ah, 3fh
    mov bx, handle
    mov cx, count
    lea dx, fileData
    int 21h

    ; get current display mode
    mov ah, 0fh
    int 10h
    mov currMode, ah

    ; set text mode 3
    mov ah, 00h
    mov al, 03h
    int 10h

    ; move to (0,0) and display fileData
    lea si, fileData
    mov di, 5
    mov al, num
    mov ah, 0
    add si, ax
x1: mov ah, 02h
    mov dl, col
    mov dh, 0
    mov bl, magenta
    mov bh, 0
    int 10h

    ; display characters
    mov ah, 09h
    mov al, [si]
    mov cx, 1
    int 10h
    inc si
    inc col
    dec di
    jnz x1

    ;closing l4task1.txt
    mov ah,3eh
    mov bx,handle
    int 21h

    ; blocking function
x2: mov ah, 08h
    int 21h
    cmp al, '?'
    jne x2

    ; restoring original mode
    mov al, currMode
    mov ah, 00h
    int 10h
.exit
end








