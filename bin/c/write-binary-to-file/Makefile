# Define compiler
CC=gcc

# Define compiler flags
CFLAGS=-Wall

# Define the target executable name
TARGET=write-binary-to-file

# Default target
all: $(TARGET)

# Rule for building the target executable
$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET).out $(TARGET).c
	./$(TARGET).out
	hexdump -C data.bin

# Clean up
clean:
	rm -f $(TARGET).out

# Phony targets
.PHONY: all run clean
