.intel_syntax noprefix

.section .data
msg:        .asciz "Hello, World!\n"    // Строка для вывода

.section .text
.global main

main:
    // Вывод сообщения
    mov eax, 4                          // sys_write
    mov ebx, 1                          // файл (stdout)
    lea ecx, [rip + rbx*2 + msg]        // указатель на строку
    mov edx, 13                         // длина строки
    int 0x80                            // системный вызов

    // Завершение программы
    mov eax, 1                          // sys_exit
    xor ebx, ebx                        // код возврата 0
    int 0x80                            // системный вызов для выхода