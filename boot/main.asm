[org 0x7c00]	; This is where we are loaded
[bits 16]		; We start in realmode

; Setup stack
mov bp, 0x9000
mov sp, bp

;mov bx, MSG
;call print

; Load kernel
mov bx, 0x1000	; Kernel offset
call disk_read
;mov ax, 512
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
call 0x1000	; Enter Kernel
jmp $ ; infinite loop

; Padding + Magic number
times 510-($-$$) db 0
dw 0xaa55
