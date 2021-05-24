[org 0x7c00]	; This is where we are loaded
[bits 16]		; We start in realmode

; Setup stack
mov bp, 0x9000
mov sp, bp

;mov bx, MSG
;call print

;mov bx, 0x9000
;call disk_read
;ov ax, 512
;call print_hex_buf

; Switch to 32bit protected mode
cli						; Clear interupts
lgdt [gdt_descriptor]	; Set the global descriptor table
mov eax, cr0
or	eax, 0x1			; Set the 32bit control bit
mov cr0, eax

; Do a far jump to start of protected mode segmnet
; Use, jmp segmnet:offset in order to flush the CPU pipeline
jmp CODE_SEGMENT:init_protected

; Includes
;%include "print.asm"
%include "disk.asm"
%include "gdt.asm"

;/////////////////////////// Protected Mode /////////////////////
[bits 32]
%include "protected.asm"
init_protected:
; Since we jumped here using a far jump, cs (code segment offset)
; is already set
mov ax, DATA_SEGMENT
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

; Update stack
mov ebp, 0x90000
mov esp, ebp

call cls
mov ebx, MSG
call print
jmp $ ; infinite loop

MSG db "Protected mode biatch", 0

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
