// .intel_syntax noprefix

// .section .data
// msg:        .asciz "Hello, World!\n"    // Строка для вывода

// .section .text
// .global main

// main:
//     // Вывод сообщения
//     mov eax, 4                          // sys_write
//     mov ebx, 1                          // файл (stdout)
//     lea rcx, [rip + msg]        // указатель на строку
//     lea rcx, [rcx + rbx*2]
//     mov edx, 14                        // длина строки
//     int 0x80                            // системный вызов

//     // Завершение программы
//     mov eax, 1                          // sys_exit
//     xor ebx, ebx                        // код возврата 0
//     int 0x80                            // системный вызов для выхода


.intel_syntax noprefix

.section .data
msg:        .asciz "Hello, World!\n"    // Строка для вывода

.section .text
.global main

main:
    // Вывод сообщения
    mov rax, 1                          // syscall: sys_write (64-битная система)
    mov rdi, 1                          // файл (stdout)
    lea rsi, [rip + msg]                // указатель на строку
    mov rdx, 14                         // длина строки
    syscall                              // системный вызов

    // Завершение программы
    mov rax, 60                         // syscall: sys_exit (64-битная система)
    xor rdi, rdi                        // код возврата 0
    syscall    