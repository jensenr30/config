#include <stdio.h>

int main() {
    // Create a file pointer
    FILE *file;

    // Open a file in binary write mode
    file = fopen("data.bin", "wb");

    // Check if file was opened successfully
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    // Define the bytes to be written
    unsigned char bytes[] = {0x01, 0x02, 0x03, 0x00};

    // Write bytes to the file
    fwrite(bytes, sizeof(bytes), 1, file);

    // Close the file
    fclose(file);

    printf("4 bytes were written to output.bin\n");

    return 0;
}
