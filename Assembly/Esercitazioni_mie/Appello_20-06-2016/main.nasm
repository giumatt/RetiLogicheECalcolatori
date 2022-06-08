;Scrivere una procedura Assembly che riceve due vettori V e W composti
;entrambi da n elementi, con n pari, e modifica l'array W come specificato:
;a) per ogni elemento W[i] della prima metà del vettore, W[i] viene posto
;   a W[i] + V[n/2+i] se la condizione W[i] > V[n/2+i] è vera, mentre
;   W[i] viene posto a 0 se la predetta condizione è falsa;
;b) per ogni elemento W[i] della seconda metà del vettore, W[i] viene posto
;   a W[i] + V[i-n/2] se la condizione W[i] > V[i-n/2] è vera, mentre
;   W[i] viene posto a 0 se la predetta condizione è falsa.
;Scrivere inoltre il programma principale che invoca opportunamente
;la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    V dw 2, 6, 9, 4, 10, 9, 1, 2, 4, 11
    W dw 8, 3, 6, 5, 9, 5, 3, 2, 10, 12
    n equ ($-W)/2

section .text
global _start
extern proc
_start:
    push dword n
    push W
    push V
    call proc