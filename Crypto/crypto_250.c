
void encrypt_file(char* file, int size, char* output) {
    char encrypted[size];
    for (int i = 0; i < size; i++) {
        char ch = file[i];

        // map [0x00 - 0x7f] to [0x81 - 0xff] and 0x7f to 0x00
        if (ch <= 0x7f) {
            encrypted[size - 1 - i] = 0xff & (ch - 0x7f);

        // map [0x81 - 0xff] to [0x00 - 0x7e]
        } else if (ch > 0x80) {
            encrypted[size - 1 - i] = 0xff & (ch + 0x7f);

        // leave 0x80 untouched
        } else {
            encrypted[size - 1 - i] = ch;
        }
    }
    strcpy(output, encrypted);
}

