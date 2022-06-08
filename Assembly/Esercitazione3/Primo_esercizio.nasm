;Bisogna calcolare y = x^2 + x + 1 per x = x_a e x = x_b

%import "../utils/util.nasm"

section .data
    x1 dd 2
    x2 dd 7

section .bss
    y1 resd 1
    y2 resd 1

section .text
global _start
_start:
    mov eax, [x1]
    call PROC
    mov [y1], eax
    mov eax, [x2]
    call PROC
    mov [y2], eax
    exit 0
PROC:
    mov ebx, eax    ;ebx = x
    mul eax         ;eax = x^2
    add eax, ebx    ;eax = x^2 + x
    inc eax
    ret ;aggiungere qualcosa
