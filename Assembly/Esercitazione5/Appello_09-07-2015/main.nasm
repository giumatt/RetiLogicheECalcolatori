;Scrivere una procedura Assembly che riceve due vettori V e W della
;stessa dimensione n e restituisce un vettore T che contiene:
;- la somma degli elementi di indice pari di V e W;
;- la copia degli elementi di indice dispari in due celle contigue.

%include "../../utils/utils.nasm"

section .data
    V dw 12, 3, 4, 3, 8
    W dw 3, 7, 5, 1, 4
    n equ ($-W)/2
    nT equ n/2*3+(n%2)

section .bss
    T resw nT

section .text
global _start
extern proc
_start:
    push T
    push word nT
    push V 
    push W
    push word n
    call proc
    xor esi, esi
ciclo_stampa:
    cmp esi, nT
    jge fine_stampa
    printw [T+esi*2]
    inc esi
    jmp ciclo_stampa
fine_stampa:
    exit 0