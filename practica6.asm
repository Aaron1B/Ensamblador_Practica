section .text
global _start

_start:
    mov eax, 10;
    add eax, 20;
    sub eax, 5;
    mov ebx, eax

    mov eax, 1;
    int 0x80