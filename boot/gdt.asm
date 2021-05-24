gdt:
gdt_null:
	dd 0x0
	dd 0x0

gdt_code:
	dw 0xffff		; Segment limit 0-15
	dw 0x0000		; Base address 0-15
	db 0x00			; Base address 16-23
	db 10011010b	; Code segment, non-system, ring 0, Present in memory
	db 11001111b	; Last nibble of segment limit + Flags << 4
	db 0x00			; Base address 31-24

gdt_data:
	dw 0xffff		; Segment limit 0-15
	dw 0x0000		; Base address 0-15
	db 0x00			; Base address 16-23
	db 10010010b	; Data segment, non-system, ring 0, Present in memory
	db 11001111b	; Last nibble of segment limit + Flags << 4
	db 0x00			; Base address 31-24
	
gdt_descriptor:
	dw gdt_descriptor - gdt - 1		; Size - 1 (Why -1, idk)
	dd gdt							; Address

; Segment offsets used to populate the segment registers
CODE_SEGMENT equ gdt_code - gdt
DATA_SEGMENT equ gdt_data - gdt
