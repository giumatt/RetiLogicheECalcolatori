;Scrivere una procedura assembly che riceve in input un vettore
;di word V di lunghezza n contenente interi positivi ed un vettore
;W di word di lunghezza h. Il vettore W viene popolato dalla procedura
;come segue.
;Ciascun elemento W[i] del vettore (i=0,..,h-1) rappresenta il
;numero di elementi del vettore V per i quali vale la relazione
;(V[j]%h)==i (j=0,...,n-1).

%include "../../utils/utils.nasm"

section .data
    V dw 6, 4, 7, 1, 9, 10, 7
    n equ ($-V)/2
    h equ 3

section .bss
    W resw h

section .text
global _start
extern proc
_start:
    push W
    push V
    push dword h
    push dword n
    call proc
    exit 0