default:
	nasm -fbin main.asm -o boot.bin && qemu-system-x86_64 boot.bin
	# Qemu option to use the rtl8139 network card, simpler driver to right than e1000
	# -device rtl8139,id=nic0,netdev=tap0 -netdev tap,id=tap0,ifname=tap0
