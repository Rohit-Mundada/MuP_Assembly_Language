.model tiny
.486
.data
;Assuming unsigned comparison with array of 5 elements
array dd 11111111h, 22222222h, 33333333h, 44444444h, 55555555h
result dd ?
.code
.startup
    lea si,array
    mov eax,[si]
    mov cl,05h
    add si,04h
l2: cmp eax,[si]
    jnb l1
    mov eax,[si]
l1: add si,04h
    dec cl
    jnz l2
    mov result,eax
.exit
end

