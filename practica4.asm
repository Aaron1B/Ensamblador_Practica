section .text
    global _start

_start:
    mov eax, 5       ; Carga el valor 5 en EAX [cite: 21]
    mov ebx, 3       ; Carga el valor 3 en EBX [cite: 21]
    add eax, ebx     ; EAX = 5 + 3 = 8 [cite: 30, 31]
    add eax, '0'     ; Convierte el número 8 al carácter ASCII '8' [cite: 32]
    
    mov [res], eax   ; Guarda el carácter en la variable 'res' [cite: 32]
    
    ; Imprime el resultado
    mov eax, 4       ; sys_write [cite: 16]
    mov ebx, 1       ; stdout [cite: 16]
    mov ecx, res     ; puntero al dato [cite: 17]
    mov edx, 1       ; longitud [cite: 17]
    int 0x80         ; llamada al kernel [cite: 16]

    ; Salida del programa
    mov eax, 1       ; sys_exit [cite: 16]
    int 0x80
    
section .bss
    res resb 1       ; Reserva 1 byte para el resultado [cite: 24]