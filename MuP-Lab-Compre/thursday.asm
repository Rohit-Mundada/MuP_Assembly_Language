.model tiny
.486
.data

currMode db ?

fileName db 'thurs.txt', 0
handle dw ?

fileData db 1500 dup(0)
count db 0

row db 0
col db 0

green db 2fh; 0010 1111
red db 4fh; 0100 1111

.code
.startup
    ; open file with RD permission
    mov ah, 3dh
    mov al, 0
    lea dx, fileName
    int 21h
    mov handle, ax

    ; read file
    lea dx, fileData
x5: mov ah, 3fh
    mov bx, handle
    mov cx, 1
    int 21h
    inc dx
    inc count
    cmp ax, 0
    jnz x5
    
    dec count

    ;close file
    mov ah,3eh
    mov bx,handle
    int 21h

    ; get current mode
    mov ah, 0fh
    int 10h
    mov currMode, al

    ; set text 3 mode 
    mov ah, 00h
    mov al, 03h
    int 10h

    ; start printing
    lea si, fileData
    mov al, count
    mov ah, 0
    mov di, ax
x3: mov ah, 02h
    mov dl, col
    mov dh, row
    mov bh, 0
    int 10h

    ; setting color for column (EVEN = red, ODD = green)
    mov al, col
    ror al, 1
    jc x1
    mov bl, red
    jmp x6
x1: mov bl, green

    ; print character
x6: mov ah, 09h
    mov al, [si]
    mov cx, 1
    int 10h

    ; increment memory loc and row value
    inc si
    inc row

    ; check if row is at last position or not, if at last then increment col value
    cmp row, 25
    jnz x2
    inc col
    mov row, 0
x2: dec di
    cmp di, 0
    jnz x3

    ; blocking function
x4: mov ah, 08h
    int 21h
    cmp al, '!'
    jne x4

    ; restoring original mode
    mov al, currMode
    mov ah, 00h
    int 10h
.exit
end







