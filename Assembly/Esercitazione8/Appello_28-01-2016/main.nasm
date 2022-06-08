;Scrivere una procedura Assembly che riceve un vettore di word A
;e restituisce un intero. La procedura verificherà se nell'array
;sia presente una sequenza di 3 elementi contigui pari la cui somma
;sia maggiore di k. In tal caso, la procedura restituirà 1, in caso
;contrario 0. Scrivere inoltre il programma principale che invochi
;opporunamente la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    V dw 5, 3, 2, 1, 4, 8, 3
    n equ ($-V)/2
    k dw 5

section .bss
    ret resw 1

section .text
global _start
extern proc
_start:
    push ret
    push V
    push dword n
    push word [k]
    call proc
    printw [ret]
    exit 0