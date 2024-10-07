.intel_syntax noprefix
.text
.align 16
.global partition

// int partition(int16_t *arr, int size, int pivot);
partition:
    push    rbp
    mov     rbp, rsp

    // Сохраняем регистры
    // push    rbx
    // push    rsi
    // push    rdi
    // push    r8
    // push    r9

    // rbx = arr (указатель на массив)
    // rsi = size (размер массива)
    // rdi = pivot (пивот)
    // r8 = left (индекс левой границы)
    // r9 = right (индекс правой границы)

    xor     r8, r8                // left = 0
    mov     r9, rsi               // right = size - 1
    dec     r9                   // size - 1

while1s:
    cmp     r8, r9
    jg      while1e

    // while (left < size && arr[left] <= pivot)
while2s:
    cmp     r8, rsi                     // проверяем, не вышли ли за границы
    jge     while2e                     // если left >= size, выходим
    movzx   rax, word ptr [rbx + r8*2]  // arr[left]
    cmp     ax, di                      // сравниваем с pivot
    jg      while2e                     // если arr[left] > pivot, выходим из цикла
    inc     r8                          // left++
    jmp     while2s                     // продолжаем проверять
while2e:

while3s:
    // while (right >= 0 && arr[right] >= pivot)
    cmp     r9, 0                       // проверяем, не вышли ли за границы
    jl      while3e                     // если right < 0, выходим
    movzx   rax, word ptr [rbx + r9*2]  // arr[right]
    cmp     ax, di                      // сравниваем с pivot
    jl      while3e                     // если arr[right] < pivot, выходим из цикла
    dec     r9                          // right--
    jmp     while3s                     // продолжаем проверять
while3e:

    // if (left >= right) break;
    cmp     r8, r9
    jge     while1e

    // swap arr[left] and arr[right]
    movzx   rcx, word ptr [rbx + r8*2]  // temp = arr[left]
    movzx   rax, word ptr [rbx + r9*2]  // arr[right] в rax
    mov     word ptr [rbx + r8*2], ax   // arr[left] = arr[right]
    mov     word ptr [rbx + r9*2], cx   // arr[right] = temp

    inc     r8                          // left++
    dec     r9                          // right--
    jmp     while1s

while1e:
    mov     edx, r8d                    // возвращаем left (mid)
    
    // Восстанавливаем регистры
    // pop     r9
    // pop     r8
    // pop     rdi
    // pop     rsi
    // pop     rbx

    pop     rbp
    ret
