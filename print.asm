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

