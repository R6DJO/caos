.intel_syntax noprefix
.global main

main:
    mov r12,0
    mov r13,0
loop:
    call readi64
    jc exit
    mov r15,rax
    and r15,1
    jz even
odd:
    add r13, rax
    jmp loop
even:
    add r12, rax
    jmp loop
exit:
    mov rdi, r12
    call writei64
    mov rdi, r13
    call writei64
    call finish