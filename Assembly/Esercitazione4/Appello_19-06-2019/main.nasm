;Scrivere una procedura Assembly che riceve un vettore V di word e restituisce
;il valore massimo tra la somma del valore assoluto degli elementi di valore pari
;di V e la somma degli elementi di posizione dispari di V.
;Scrivere inoltre il programma principale che invoca la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    V dw -2, 3, 7, 6, 2, -10, -3, 5
    n equ ($-V)/V

section .bss
    max resw 1

section .data
global _start
extern getMax
_start:
    sub esp, 2
    push V
    push dword n
    call getMax
    pop word [max]
    printw word [max]
    exit 0