#include <stdio.h>

extern int A, B, R;
void process();

int main() {
    scanf("%d%d", &A, &B);
    process();
    printf("%d\n", R);
}