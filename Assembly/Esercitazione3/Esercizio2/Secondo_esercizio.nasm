;Scrivere una procedura che effettui la somma di tutti gli elementi dell'array
;int sum (int[] x, int n) //n lunghezza array

%include "../../utils/utils.nasm"

section .data
    x dw 2, -3, 5, 10, 7, -1
    n equ ($-x)/2


section .text
global _start
extern sum
_start:
    sub esp, 2
    push x
    push dword n
    call sum
    pop ax
    printw ax