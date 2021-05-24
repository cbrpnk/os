; Print zero terminated string pointed by ebx
print:
	pusha
	mov ecx, 0xb8000	; Memory mapped buffer
print_loop:
	cmp [ebx], byte 0
	je print_end
	mov al, [ebx]		; M for Manu
	mov ah, 0x0f		; White on black
	mov [ecx], ax		; M for Manu
	add ecx, 2
	inc ebx
	jmp print_loop
print_end:
	popa
	ret

cls:
	pusha
	mov cx, 0
	mov edx, 0xb8000
cls_loop:
	cmp cx, 3840 ; VGA buffer len, 80 columns * 24 rows * 2 bytes wide
	jge	cls_end
	mov [edx], byte 0
	inc cx
	inc edx
	jmp cls_loop
cls_end:
	popa
	ret
