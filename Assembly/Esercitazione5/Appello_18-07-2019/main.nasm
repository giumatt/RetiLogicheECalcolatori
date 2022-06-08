;Scrivere una procedura Assebly che riceve un vettore V di word
;e un valore K e restituisce il numero di coppie di elementi
;(V[i], V[(i+1)%n]), dove n è la lunghezza di V, tali che la loro somma
;non è multipla di 2^k. Scrivere inoltre il programma principale che invoca
;opportunamente la procedura descritta. Si noti che le coppie da considerare sono:
;(V[0], V[1]), (V[1], V[2]), ..., (V[n-2], V[n-1]), (V[n-1], V[0])

%include "../../utils/utils.nasm"

section .data
    V dw 1, 3, 5, -2, 1, 7, -3, 7
    n equ ($-V)/2
    k db 4

section .bss
    c resw 1

section .text
global _start
extern proc
_start:
    push c
    push V
    push word n
    push byte [k]
    call proc
    printw [c]
    exit 0