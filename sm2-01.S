.intel_syntax noprefix
.global main

main:
    mov r12,0
loop:
    call readi32
    jc read
    push rax
    inc r12
    jmp loop
read:
    cmp r12, 0
    jz exit
    pop rdi
    call writei32 
    dec r12
    jmp read
exit:
    call finish