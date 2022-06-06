;Calcolare il prodotto scalare

%include "../utils/utils.nasm"

section .data
x dw 12,5,-2,8,-1
y dw 20,-26,22,0,4
n equ ($-y)/2

section .bss
p resd 1

section .text
global _start
_start:
    xor eax, eax
    xor esi, esi
ciclo:
    cmp esi, n
    jge fine
    mov ebx, [x+2*esi]
    mov ecx, [y+2*esi]
    imul ebx, ecx
    add eax, ebx
    inc esi
    jmp ciclo
fine:
    mov [p], eax
    exit 0
