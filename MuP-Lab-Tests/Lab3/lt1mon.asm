.model tiny
.data
exm1 db 'OMrCimheRISAiaOHFvaM'
roh43 db ?
name1 db 'R'
.code
.startup
    lea si,exm1
    mov dl,name1    ;dl stores ASCII of 'R'
    mov cl,20
    mov ch,00   ;ch stores the count of occurrence of 'I' or 'i' 
    mov bl,'Z'
    sub bl,dl   ;bl stores the offset of 'Z' to 'R'
    mov bh,'A'  
    add bh,bl   ;bh stores the corresponding letter of R (which is 'I') 
    mov bl,bh   
    add bl,20h  ;bl stores 'i'
x2: cmp bh,[si]
    jne x1
    inc ch
x1: inc si
    dec cl
    jnz x2
    mov roh43,ch	;count of occurrence is stored in offset roh43
.exit
end



