;Scrivere una procedura Assembly che riceve un vettore di word V
;e restituisce il numero di elementi distinti presenti in V.

%import "../../utils/utils.nasm"

section .data
    V dw 3, 4, 3, 2, 1
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
    pushw [c]
    exit 0