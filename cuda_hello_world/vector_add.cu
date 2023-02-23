#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100000000

__global__ void vector_add(float *out, float *a, float *b, int n) {
    out[i] = a[i] + b[i];
}

int main() {
    float *a, *b, *out;

    a = (float *)malloc(sizeof(float) * N);
    b = (float *)malloc(sizeof(float) * N);
    out = (float *)malloc(sizeof(float) * N);

    for (int i = 0; i < N; i++) {
        a[i] = (float)(1.0f * i);
        b[i] = (float)(2.0f * i);
    }

    clock_t start, end;
    start = clock();
    vector_add<<<1, 1>>>(out, a, b, N);
    end = clock();

    double time_used = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Function took %f seconds\n", time_used);
}