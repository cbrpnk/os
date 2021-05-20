[org 0x7c00]

; Setup stack
mov bp, 0x8000
mov sp, bp

mov bx, str
mov ax, 5
call print_hex_buf

jmp $ ; infinite loop

%include "print.asm"

str:
	db "abcde"

; Padding + Magic number
times 510-($-$$) db 0
dw 0xaa55
