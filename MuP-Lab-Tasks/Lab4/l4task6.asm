.model tiny
.data
fileName db "l4task5.txt", 0
newFName db "ID.txt", 0
.code
.startup
    ;change file name
    mov ah,56h
    lea dx,fileName
    lea di,newFName
    int 21h
.exit
end

