section .data
    mensaje db "Introduce el mensaje:", 10
    lenMensaje equ $ - mensaje

section .bss
    entrada resb 50

section .text
global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, lenMensaje
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, entrada
    mov edx, 50
    int 0x80

    mov edx, eax
    mov eax, 4
    mov ebx, 1
    mov ecx, entrada
    int 0x80

    mov eax, 1
    mov ebx, 0 
    int 0x80
    