;Dato un vettore di word V, contare gli elementi che
;verificano una delle seguenti condizioni:
;1. V[i] >= 0 e V[i + 2] < 0 e |V[i] - V[i + 2]| > 4
;2. V[i] < 0 e V[i + 1] >= 0 e |V[i] - V[i + 1]| > 2

;N. B. Nel caso 1 la differenza è sempre positiva, nel caso 2 è sempre negativa.

%include "../../utils/utils.nasm"

section .data
    V dw -1, 3, -2, -5, -6, 2, -1
    n equ ($-V)/2

section .bss
    c resw 1

section .text
extern check
global _start
_start:
    push c
    push dword n
    push V
    call check
    printdw word [c]
    exit 0