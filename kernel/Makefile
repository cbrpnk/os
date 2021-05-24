default:
	nasm entry.asm -f elf -o entry.o
	/opt/cross/bin/i386-elf-gcc -ffreestanding -fno-exceptions -c main.c -o main.o
	/opt/cross/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 --oformat binary entry.o main.o
