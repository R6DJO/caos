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

main:
    call readi32
    cmp eax, 0
    jl exit
    mov ebx, eax    
l1:
    mov edi, ebx
    call writei32
    dec ebx
    cmp ebx, 0
    jge l1  
exit:
    call finish 