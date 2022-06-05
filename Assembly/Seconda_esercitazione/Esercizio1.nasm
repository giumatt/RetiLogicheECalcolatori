;Dato un vettore v, scrivere un programma che effettui la somma
;di tutti i valori multipli di K presenti all'interno di v.

%include "../utils/utils.nasm"

section .data
    v dd 12,5,-2,8,-1
    n equ ($-v)4
    k dd 3

section .bss
    s resd 1

section .text
global _start
_start:
    mov ebx, 0
    mov esi, 0
    mov ecx, [k]
ciclo:
    cmp esi, n
    jge fine
    mov eax, [v+esi*4]
    cdq                     ;eax ---> edx:eax
    idiv ecx                ;eax/ecx
    cmp edx, 0              ;se resto divisione = 0
    jne no
    add ebx, [v+esi*4]
no:
    inc esi
    jmp ciclo
fine:
    mov [s], ebx
    exit 0