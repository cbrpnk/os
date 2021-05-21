[org 0x7c00]

; Setup stack
mov bp, 0x8000
mov sp, bp

;mov bx, str
;mov ax, 5
;call print_hex_buf

mov bx, str
call print

mov bx, 0x9000
call disk_read
mov ax, 512
call print_hex_buf

jmp $ ; infinite loop

; Includes
%include "print.asm"
%include "disk.asm"

str:
	db "Manu Boot Loader", 0x0a, 0

; Padding + Magic number
times 510-($-$$) db 0
dw 0xaa55

; Second sector
db 0x11
db 0x22
db 0x33
db 0x44
db 0x55

; Padding to the end of 2nd sector
times 1024-($-$$) db 0
