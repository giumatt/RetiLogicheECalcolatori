;Scrivere una procedura Assembly che riceve un vettore di word A
;e restituisce un intero. La procedura verificher√† se nell'array
;sia presente una sequenza di 3 elementi contigui pari la cui somma
;sia maggiore di k. In tal caso, la procedura restituir√† 1, in caso
;contrario 0. Scrivere inoltre il programma principale che invochi
;opportunamente la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    V dw 5, 3, 2, 1, 4, 8, 3
    n equ ($-V)/2
    k dw 5

section .bss
    ris resw 1

section .text
global _start
extern proc
_start:
    push ris
    push V
    push dword n
    push word [k]
    call proc
    printw [ris]
    exit 0