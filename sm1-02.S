.intel_syntax noprefix
.global main

// Библиотека ввода-вывода для ассемблера x86: simpleio_x86_64.S
// Все библиотечные функции не меняют значения регистров rsp, rbp, rbx, r12, r13, r14, r15.
// call writei32   // напечатать на экране значение edi
//                 // как знаковое десятичное число
// call readi32    // ввести с клавиатуры число и сохранить в eax
// call readi64    // ввести с клавиатуры число и сохранить в rax
// call writei64   // вывести rdi
// call finish     // завершить исполнение программы

//r12     r13      r14 
// A - 2 * B + 17 * C

main:
    call readi64
    mov r12,rax
    call readi64
    mov r13,rax
    call readi64
    mov r14,rax
    call readi64
    mov rdi,rax
    call writei64
    
    mov r15,r14
    sal r14,4
    add r14,r15

    sal r13,1
    sub r14,r13
    
    add r12,r14

    mov rdi, r12
    call writei64
    call finish