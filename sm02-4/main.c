#include <stdio.h>
#include <stdint.h>

// int partition();
int partition(int16_t *arr, int size, int pivot);
int invoke(int16_t *arr, int size, int pivot);

int main()
{
    int16_t arr[] = {10, 30000, 30000, 7, 0, 5, 4, 20000, -21000, 1};
    int size = sizeof(arr) / sizeof(arr[0]);
    int pivot = 5;

    int mid = invoke(arr, size, pivot);
    // int mid = partition(arr, size, pivot);

    printf("Mid: %d\n", mid);
    printf("Rearranged array: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
