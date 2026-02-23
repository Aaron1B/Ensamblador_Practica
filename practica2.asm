section .data
    msg db 'Hola, Ensamblador!', 0xA  ; Definimos el mensaje y un salto de línea (0xA)
    len equ $ - msg                   ; Calculamos la longitud del mensaje automáticamente

section .text
    global _start                     ; Le decimos al linkador dónde empieza el programa

_start:
    ; --- Paso 1: Imprimir en pantalla ---
    ; Para hacer esto, usamos una "Syscall" (Llamada al sistema)
    mov rax, 1          ; El ID de la syscall 'write' es 1
    mov rdi, 1          ; El destino es 1 (stdout / pantalla)
    mov rsi, msg        ; Cargamos la dirección del mensaje
    mov rdx, len        ; Cargamos la cantidad de bytes a escribir
    syscall             ; ¡Ejecuta la orden, Linux!

    ; --- Paso 2: Salir del programa limpiamente ---
    mov rax, 60         ; El ID de la syscall 'exit' es 60
    xor rdi, rdi        ; Ponemos RDI en 0 (código de éxito)
    syscall             ; Ejecuta la salida