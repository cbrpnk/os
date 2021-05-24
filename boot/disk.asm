; Read 1 sector to es:bx
disk_read:
	pusha
	mov ah, 0x02	; Read
	mov ch, 0x00	; Cylinder
	mov cl, 0x02	; Right after boot sector
	mov dh, 0x00	; Head
	; dl already has the drive number set by the BIOS
	
	mov al, 0x01	; Numbers of sectors to read
	
	int 0x13
	; TODO Error handeling
	
	popa
	ret
