.intel_syntax noprefix
.global main

main:
    call readi32
    mov [rip+A], eax
    call readi32
    mov [rip+B], eax
    call process
    mov edi, [rip+R]
    call writei32
    call finish
