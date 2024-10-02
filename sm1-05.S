.intel_syntax noprefix
.global main

main:
    mov r14,0
    mov r13,63
    call readi64
    mov r12,rax
loop:
    cmp r13, 0
    jl exit
    mov rax,r12
    and rax,1
    jz pass
    inc r14
pass:
    sar r12
    dec r13
    jmp loop
exit:
    mov rdi, r14
    call writei64
    call finish
