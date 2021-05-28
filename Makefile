default:
	# Make bootsector
	cd boot && $(MAKE)
	# Make Kernel
	cd kernel && $(MAKE)
	# Create image
	cat boot/boot.bin kernel/kernel.bin > os.img
	ls -lh kernel/kernel.bin
	# Boot
	qemu-system-x86_64 os.img

run:
	qemu-system-x86_64 os.img

clean:
	rm boot/boot.bin
	rm kernel/*.o
	rm kernel/kernel.bin
	
	# Qemu option to use the rtl8139 network card, simpler driver to right than e1000
	# -device rtl8139,id=nic0,netdev=tap0 -netdev tap,id=tap0,ifname=tap0
