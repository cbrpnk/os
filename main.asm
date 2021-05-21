[org 0x7c00]

; Setup stack
mov bp, 0x9000
mov sp, bp

mov bx, intro_msg
call print

;mov bx, 0x9000
;call disk_read
;mov ax, 512
;call print_hex_buf

; Switch to 32bit protected mode
cli						; Clear interupts
lgdt [gdt_descriptor]	; Set the global descriptor table
mov eax, cr0
or	eax, 0x1			; Set the control bit
mov cr0, eax

; TODO We have to jump far away to flush the cpu pipeline

jmp $ ; infinite loop

; Includes
%include "print.asm"
%include "disk.asm"
%include "gdt.asm"

intro_msg:
	db "Manu Boot Loader", 0x0a, 0

; Padding + Magic number
times 510-($-$$) db 0
dw 0xaa55


; ---------------- Second sector starts here ------------------

db 0x11
db 0x22
db 0x33
db 0x44
db 0x55

; Padding to the end of 2nd sector
times 1024-($-$$) db 0
