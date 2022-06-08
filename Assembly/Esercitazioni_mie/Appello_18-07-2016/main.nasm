;Scrivere una procedura Assembly che riceve due vettori V e W
;composti entrambi da n elementi, con n pari, e restituisce un
;array T di dimensione pari a 2n composto come segue:
;per ogni i, se gli elementi V[i] e W[i] sono entrambi pari, questi
;dovranno essere inseriti in T, altrimenti in T dovranno essere inseriti
;gli elementi -V[i] e -W[i].

%include "../../utils/utils.nasm"

section .data
    V dw 2, 6, 9, 4, 10, 9, 1, 2, 4, 11
    W dw 8, 3, 6, 5, 8, 5, 3, 2, 10, 2
    n equ ($-W)/2

section .bss
    T resw 2*n

section .text
global _start
extern proc
_start:
    push dword n
    push T
    push W
    push V
    call proc
    xor esi, esi
.ciclo_stampa:
    cmp esi, 2*n
    jge .fine_stampa
    mov ax, [T+2*esi]
    printw ax
    inc esi
    jmp .ciclo_stampa
.fine_stampa:
    exit 0