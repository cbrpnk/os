int print(const char *str) {
    unsigned short *vga = (unsigned short *) 0xb8000;
    char *c = str;
    
    while(*c != 0) {
        *vga = 0x0f00 | *c;
        ++vga;
        ++c;
    }
    
    return 0;
}

int main()
{
    print("Welcome to Manu OS V.0.0.0.0.1 alpha");
    return 0;
}
