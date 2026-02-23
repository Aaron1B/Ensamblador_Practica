section .data
    mensaje db 'Perro' , 10
    longitud equ $ - mensaje

section .text
global _start

_start: 
    mov eax, 4
    mov ebx, 1

    mov ecx, mensaje
    mov edx, longitud
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80