.model tiny
.486
.data

currMode db ?

inputMax db 16
inputAct db ?
inputDat db 17 dup('$')

copycon db 'copycon'
invalid db 'Invalid Command$'

handle dw ?
fileName db 7 dup(0)

greenB equ 8ah; 1000 1010
greenNb equ 0ah; 0000 1010

dat1 db 200 dup(0)

.code
.startup
    ; get current mode
    mov ah,0fh
    int 10h
    mov currMode,al
    
    ; get input
    lea dx,inputMax
    mov ah,0ah
    int 21h
    
    ; compare first 7 input chars with 'copycon'
    mov cx,7	
    lea di,inputDat
    lea bx,copycon
x2:	mov ah,[di]
    mov al,[bx]
    cmp ah,al
    jnz x1
    inc bx
    inc di
    loop x2
    
    ; store file name
    lea bx,inputDat
    add bx,8
    mov di,bx
    lea si,fileName
    mov cx,7
x3:	mov bh,[di]
    inc di
    mov [si],bh
    inc si
    loop x3
    
    ; create file
    mov ah,3ch
    lea dx,fileName
    mov cl,20h
    int 21h
    mov handle,ax
    
    ; set text mode 3
    mov ah,0h
    mov al,03h
    int 10h
    
    ; go to (0,0)
    mov dh,0h
    mov dl,0h
    mov bh,0h
    mov bl,greenB
    mov ah,02h
    int 10h
    
    ; display '>' in blinking bright green
    mov ah,09h
    mov al,'>'
    mov cx,1
    int 10h
    
    ; display text in bright green
    inc dl
    mov bl,greenNb
    lea di,dat1
x4:	mov ah,02h
    int 10h
    
    ; get input without echo
    mov ah,07h
    int 21h
    cmp al,'@'
    jz x5
    
    ; display character inputted
    mov ah,09h
    mov cx,1
    int 10h
    
    ; stpre character in memory
    mov [di],al
    inc di
    inc dl
    jmp x4
    
    ; open file
x5: mov ah,3dh
    mov al,2h
    lea dx,fileName
    int 21h		

    ; get number of bytes to write
    mov cx,di
     
    ; write to file 
    mov ah,40h
    mov bx,handle
    lea dx,dat1
    int 21h
    
    ; close file
    mov ah,3eh
    mov bx,handle
    int 21h
    
    ; restore original mode
    mov ah,00h
    mov al,currMode
    int 10h
    jmp x6
    
    ; display 'Inavlid Command'
x1: lea dx,invalid
    mov ah,09h
    int 21h
    
x6:		
.exit
end




