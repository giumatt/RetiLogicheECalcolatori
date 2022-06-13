;Scrivere una procedura Assembly che riceve un vettore V di word
;di lunghezza n, con n dispari, e conta il numero di coppie di elementi
;(V[i], V[i+1+n/2]) tali che la loro differenza in valore assoluto è maggiore
;dell'elemento centrale del vettore, cioè:
;       |V[i] - V[i+1+n/2]| > V[n/2] per ogni i app. [0, ..., n/2-1]

%include "../../utils/utils.nasm"

section .data
    V dw 11, 1, -8, 5, 4, -3, 2
    n equ ($-V)/2

section .bss
    c resw 1

section .text
global _start
extern proc
_start:
    push c
    push V
    push dword n
    call proc
    printw [c]
    exit 0