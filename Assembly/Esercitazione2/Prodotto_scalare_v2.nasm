;Prodotto scalare 2.0

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
    xor esi, esi
    ;ax, bx non utilizzabili
    mov edi, 0
ciclo:
    cmp esi, n
    jge fine
    mov ax, [x+2*esi]
    imul word[y+2*esi]
    mov cx, dx              ;ecx = [???......?|H]
    shl ecx, 16             ;ecx = [H|0........0]
    mov bx, ax              ;ecx = [H|L]
    add edi, ecx
    inc esi
    jmp ciclo
fine:
    mov [p], edi
    exit 0


