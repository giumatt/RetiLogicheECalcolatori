;Scrivere una procedura assembly che riceve un vettore di word A e
;un vettore di word B e restituisce un intero.
;Il vettore A viene utilizzato per accedere ad elementi distinti del vettore B.
;L'istruzione verificherà se la sequenza degli elementi del vettore B le cui posizioni
;sono presenti in A è ordinata in senso crescente. In questo caso, l'istruzione
;restituirà un 1. In caso contrario, restituirà uno 0.
;Scrivere inoltre il programma principale che invochi opportunamente
;la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    A dw 2, 3, 1
    nA equ ($-A)/2
    B dw 3, 4, -1, -2
    nB equ ($-B)/2

section .bss
    ris resb 1

section .text
global _start
extern proc
_start:
    push ris
    push word nB
    push B
    push word nA
    push A
    call proc
    printb byte [ris]
    exit 0