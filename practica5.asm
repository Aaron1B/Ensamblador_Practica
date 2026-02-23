section .text
    global _start

_start:
    mov eax, 10       ; Carga el valor 5 en EAX [cite: 21]
    mov ebx, 20       ; Carga el valor 3 en EBX [cite: 21]
    
    pop eax
    pop ebx
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    res resb 1       ; Reserva 1 byte para el resultado [cite: 24]