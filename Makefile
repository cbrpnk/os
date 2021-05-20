default:
	nasm -fbin bootsec.asm -o bootsec.bin && qemu-system-x86_64 -nographic bootsec.bin
