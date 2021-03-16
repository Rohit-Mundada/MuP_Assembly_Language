.model tiny
.data

disp1 db "Enter User Name", 0dh, 0ah, '$'
disp2 db 0dh, 0ah, "Enter Password", 0dh, 0ah, '$'
disp3 db 0dh, 0ah, "Hello ", '$'

db_uname db "Rohit"
db_pass db "flash"

uname_mx db 9
uname_at db ?
uname_dt db 9 dup('$')  

pass_dat db 5 dup('$')

.code
.startup
    ;display "Enter User Name"
    lea dx,disp1
    mov ah,09h
    int 21h

    ;get user name
    lea dx,uname_mx
    mov ah,0ah
    int 21h

    ;check user name with user name in memory
    mov cl,uname_at
    mov ch,0h
    lea si,uname_dt
    lea di,db_uname
    cld
    repe cmpsb
    cmp cx,0h
    jnz x1

    ;display "Enter Password"
    lea dx,disp2
    mov ah,09h
    int 21h

    ;get password byte-by-byte and display * in terminal
    lea si,pass_dat
    mov cl,5
x2: mov ah,08h
    int 21h
    mov [si],al
    mov dl,'*'
    mov ah,02h
    int 21h
    inc si
    dec cl
    jnz x2

    ;check password with password in memory
    mov cl,5
    mov ch,0h
    lea si,pass_dat
    lea di,db_pass
    cld
    repe cmpsb
    cmp cx,0h
    jnz x1

    ;display "Hello <User_Name>" if password is correct
    lea dx,disp3
    mov ah,09h
    int 21h
    lea dx,uname_dt
    mov ah,09h
    int 21h

    ;terminate if either username or password does not match with memory
x1: 
.exit
end