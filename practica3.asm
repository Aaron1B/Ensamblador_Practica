section .data
    pregunta db 'Escribe una letra: '  ; El mensaje
    len_p equ $ - pregunta             ; Longitud del mensaje

section .bss
    letra resb 1        ; RESERVAMOS 1 byte de espacio (para 1 letra)

section .text
    global _start

_start:
    ; --- 1. IMPRIMIR LA PREGUNTA ---
    mov rax, 1          ; ID Syscall 'write' (escribir)
    mov rdi, 1          ; Destino: Pantalla
    mov rsi, pregunta   ; Qué escribir: La dirección del mensaje
    mov rdx, len_p      ; Cuánto escribir: La longitud
    syscall

    ; --- 2. LEER LO QUE ESCRIBE EL USUARIO ---
    mov rax, 0          ; ID Syscall 'read' (leer)
    mov rdi, 0          ; Origen: Teclado (0 es stdin)
    mov rsi, letra      ; Dónde guardar: En la variable vacía que creamos en .bss
    mov rdx, 1          ; Cuánto leer: Solo 1 byte (una letra)
    syscall

    ; --- 3. IMPRIMIR LO QUE EL USUARIO ESCRIBIÓ ---
    mov rax, 1          ; ID Syscall 'write'
    mov rdi, 1          ; Destino: Pantalla
    mov rsi, letra      ; Qué escribir: La letra que guardamos antes
    mov rdx, 1          ; Cuánto escribir: 1 byte
    syscall

    ; --- 4. SALIR (OBLIGATORIO) ---
    mov rax, 60         ; ID Syscall 'exit'
    xor rdi, rdi        ; Código 0 (todo bien)
    syscall