; Print null terminated ASCII string in bx
print:
	pusha
	mov ah, 0x0e
	print_loop:
		mov al, [bx]
		cmp al, 0
		je print_end
		int 0x10
		inc bx
		jmp print_loop
	print_end:
		popa
		ret

; Get len in ax, buff in bx
print_hex_buf:
	pusha
	mov cx, 0 ; Init counter
	start:
		cmp cx, ax
		jge end
		mov dx, [bx]
		call print_hex_byte
		; Print space
		mov dl, ' '
		call print_char
		inc cx
		inc bx
		jmp start
	end:
		popa
		ret

print_char:
	pusha
	mov ah, 0x0e
	mov al, dl
	int 0x10
	popa
	ret

; Get byte in dx
print_hex_byte:
	pusha ; Save Registers
	mov ah, 0x0e ; tty mode
	
	; High nibble
	mov bx, dx
	and bx, 0xf0
	shr bx, 4
	add bx, hex_chars

	; Print
	mov al, [bx]
	int 0x10
	
	; Low nibble
	mov bx, dx
	and bx, 0x0f
	add bx, hex_chars

	; Print
	mov al, [bx]
	int 0x10

	popa ; Restore registers
	ret


hex_chars:
	db '0123456789abcdef'

