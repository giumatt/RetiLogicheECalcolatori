;Scrivere una procedura assembly che riceve un vettore di word
;V di lunghezza n e lo modifica come descritto di seguito.
;Per ciascuna coppia (V [i], V [i + 1]) tale che V [i] > 4 · V [i + 1],
;la procedura scambia i due elementi della coppia.
;Al termine della sua esecuzione, la procedura restituisce il numero di scambi effettuati.

%include "../../utils/utils.nasm"

section .data
    V dw -2, 5, 1, 3, -1, 1, -6
    n equ ($-V)/2

section .bss
    c resb 1

section .text
global _start
extern proc
_start:
    push c
    push V
    push dword n
    call proc
    xor esi, esi
.ciclo_stampa:
    cmp esi, n
    jge .fine
    printw [v+esi*2]
    inc esi
    jmp c
.fine:
    printb dword [c]
    exit 0