int puts(const char* str);

int main(int argc, char* argv[]) {
    for (int i = 0; i < argc; i++) {
        puts("Hello World!");
    }
    if (argc > 1) {
        puts(argv[1]);
    }
    return 0;
}
