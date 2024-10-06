#include <stdint.h>

int partition(int16_t *arr, int size, int pivot) {
    int left = 0;
    int right = size - 1;

    while (left <= right) {
        // Найти элемент слева, который больше pivot
        while (arr[left] <= (int16_t)pivot && left < size) {
            left++;
        }

        // Найти элемент справа, который меньше pivot
        while (arr[right] >= (int16_t)pivot && right >= 0) {
            right--;
        }

        // Если указатели пересеклись, заканчиваем цикл
        if (left >= right) {
            break;
        }

        // Меняем местами элементы arr[left] и arr[right]
        int16_t temp = arr[left];
        arr[left] = arr[right];
        arr[right] = temp;

        // Сдвигаем указатели
        left++;
        right--;
    }

    return left;  // Возвращаем индекс разделения
}

// int partition(int16_t *arr, int size, int pivot) {
//     // int a=arr[0]+size+pivot;
//     return 0;
// }