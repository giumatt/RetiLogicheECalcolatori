;Dato un vettore v, scrivere un programma che restituisca l'indirizzo
;in corrispondenza del quale è posizionato il massimo del vettore.

%include "../utils/utils.nasm"

section .data
    x dd 12,5,-2,8,-1
    n equ ($-y)/4

section .bss
    ind_max resd 1

section .text
global _start
_start:
    mov eax, [x]    ;massimo corrente
    mov ebx, x      ;indirizzo del massimo corrente
    mov ecx, ebx    ;indirizzo corrente
    add ecx, 4
    mov esi, 1
ciclo:
    cmp esi, n
    jge fine
    cmp eax, [ecx]
    jge no
    ;aggiornamento del massimo
    mov eax, [ecx]
    mov ebx, ecx
no:
    inc esi
    add ecx, 4
    jmp ciclo
fine:
    mov [ind_max], ebx
    exit 0

;Prossima lezione da guardare:
;   https://web.microsoftstream.com/video/6ea59d0b-d6a3-43cc-a279-5c831144d016