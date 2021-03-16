.model tiny
.data
fileName db "ID.txt", 0
.code
.startup
    ;delete file
    mov ah,41h
    lea dx,fileName
    int 21h
.exit 
end
