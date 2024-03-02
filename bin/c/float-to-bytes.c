#include <stdio.h>
#include <stdint.h>

int main(void) {
    union {
        float f32;
        int i32;
    } number;

    number.f32 = 1337.42;

    uint8_t bytes[4] = {
         (uint32_t)number.i32        & 0xff,
        ((uint32_t)number.i32 >>  8) & 0xff,
        ((uint32_t)number.i32 >> 16) & 0xff,
        ((uint32_t)number.i32 >> 24) & 0xff
    };

    printf("[");
    for (int i = 0; i < 4; i++) {
        printf ("%d, ", bytes[i]);
    }
    printf("]\n");

    printf("[");
    for (int i = 0; i < 4; i++) {
        printf ("0x%02x, ", bytes[i]);
    }
    printf("]\n");

    return 0;
}