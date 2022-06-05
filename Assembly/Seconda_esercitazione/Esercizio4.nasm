;Dato un vettore v, scrivere un programma che conti il numero di elementi
;la cui codifica binaria ha esattamente K bit.

%include "../utils/utils.nasm"

section .data
    x dd 12,5,-2,8,-1
    n equ ($-y)/4
    k dd 5

section .bss
    ret resd 1

section .text
global _start
_start:
    mov esi, 0
    mov eax, 0
ciclo:
    cmp esi, n
    jge fine
    mov ebx, [x+esi*4]
    xor edi, edi
    xor ecx, ecx
ciclo_2:
    cmp edi, 32
    jge fine_2
    shr ebx, 1
    ;controllo carry flag
    jnc no_uno
    inc ecx
no_uno:
    inc edi
    jmp ciclo_2
fine_2:
    cmp ecx, [k]
    jne no
    inc eax
no:
    inc esi
    jmp ciclo
fine:
    mov [ret], eax
    exit 0