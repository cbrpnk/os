default:
	nasm -fbin main.asm -o boot.bin && qemu-system-x86_64 -nographic boot.bin
