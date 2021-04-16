.model tiny
.486
.data

currMode db ?

fileName db 11 dup(0)
handle dw ?

filedata db 40 dup(?)
char db ?
	
.code
.startup
    ; get current mode
    mov ah,0fh    
    int 10h 
    mov currMode,al

    ; set text mode 3
    mov ah,00h      
    mov al,03h
    int 10h
    
    lea di,filedata
    mov dh,00
    mov bp,4
x2:	mov dl,dh
    mov si,10
x1:	mov ah,08h
    int 21h
    mov char,al
    cmp al,0dh ; ASCII of Carriage Return = 0Dh
    jz x3
    
    mov [di],al
    
    ; set cursor position
    mov ah,02h      
    mov bh,00
    int 10h
    
    mov ah,09h
    mov al,[di]
    mov bh,0
    mov bl,00000101b
    mov cx,1
    int 10h
    
    inc dl
    inc di
    dec si
    jnz x1
    
    inc dh
    dec bp
    jnz x2

x3:	mov ah,00h
    mov al,currMode
    int 10h
    
    lea si,filedata
    lea di,fileName
    mov cx,10
x4:	movsb
    loop x4
    
    ; create file
    mov ah,3ch   
    lea dx,fileName
    mov cx,20h
    int 21h
    mov handle,ax  
    
    ; open file
    mov ah,3dh      
    lea dx,fileName
    mov al,02h
    int 21h
    
    lea di,filedata
    mov al,10
    mov ah,00
    add di,ax
    
    ; write to file
    mov ah,40h      
    mov bx,handle
    mov dx,di
    mov cx,30
    int 21h
    
    ; close file
    mov ah,3eh
    mov bx,handle
    int 21h	
.exit
end