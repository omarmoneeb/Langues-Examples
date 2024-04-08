#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int is_prime(int n) {
    if (n < 2)
        return 0;
    if (n == 2)
        return 1;
    if (n % 2 == 0)
        return 0;
    for (int i = 3; i <= sqrt(n); i += 2) {
        if (n % i == 0)
            return 0;
    }
    return 1;
}

int is_perfect_square(int n) {
    if (n <= 0) return 0;
    int root = (int)sqrt(n);
    return n == root * root;
}

int find_first_prime(int list[], int size) {
    for (int i = 0; i < size; ++i) {
        if (is_prime(list[i])) return i;
    }
    return -1;
}

int find_last_square(int list[], int size) {
    for (int i = size - 1; i >= 0; --i) {
        if (is_perfect_square(list[i])) return i;
    }
    return -1;
}

int main() {
    int size;
    printf("Enter the size of the array:\n");
    scanf("%d", &size);
    if (size <= 0) {
        printf("Invalid size!\n");
        return 1;
    }

    int *L = (int *)malloc(size * sizeof(int));
    printf("Enter %d numbers for the array:\n", size);
    for (int i = 0; i < size; ++i) {
        scanf("%d", &L[i]);
    }

    int first_prime_idx = find_first_prime(L, size);
    int last_square_idx = find_last_square(L, size);

    if (first_prime_idx != -1 && last_square_idx != -1 && first_prime_idx < last_square_idx) {
        printf("Sublist S contains: ");
        printf("%d ", L[first_prime_idx]);
        for (int i = first_prime_idx + 1; i < last_square_idx; ++i) {
            printf("%d ", (int)pow(L[i], 3));
        }
        printf("%d\n", L[last_square_idx]);
    } else {
        printf("No valid sublist can be formed.\n");
    }

    free(L);
    return 0;
}
