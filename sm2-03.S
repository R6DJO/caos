.intel_syntax noprefix
.global main

.macro SET_ALIAS alias, reg
    \alias = \reg        // Устанавливаем псевдоним для регистра
.endm

SET_ALIAS val, rax       // Задаем псевдоним val для регистра rax

main:
    call  readi64
    mov   rdi, val
    add   rdi, [rip + delta]
    call  writei64
    call  finish
delta:
    .quad 42