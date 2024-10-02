#include <stdio.h>
#include <stdint.h>

int partition(int16_t *arr, int size, int pivot) {
    int left = 0;
    int right = size - 1;

    while (left <= right) {
        // Найти элемент слева, который больше pivot
        while (arr[left] <= pivot && left < size) {
            left++;
        }

        // Найти элемент справа, который меньше pivot
        while (arr[right] >= pivot && right >= 0) {
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


int main() {
    int16_t arr[] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    int size = sizeof(arr) / sizeof(arr[0]);
    int pivot = 5;

    int mid = partition(arr, size, pivot);

    printf("Mid: %d\n", mid);
    printf("Rearranged array: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
