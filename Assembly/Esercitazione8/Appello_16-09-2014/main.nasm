;Scrivere una procedura Assembly che riceve un vettore di double word V,
;un vettore di word W ed un vettore di word Z, tutti della stessa lunghezza.
;Il primo vettore contiene indirizzi di memoria, in ciascuno dei quali è
;memorizzato un intero a 16 bit, mentre il secondo vettore contiene gli interi.
;La procedura memorizza in ogni elemento Z[i] la somma tra l'intero W[i] e
;l'intero memorizzato nell'indirizzo contenuto in V[i]. Scrivere inoltre il
;programma principale che invochi opportunamente la procedura descritta.

%include "../../utils/utils.nasm"

section .data
    V dd 1076, 1032, 4600, 3800
    W dw 6, 2, -4, -3
    n equ ($-W)/2

section .bss
    Z resw n

section .text
global _start
extern proc
_start:
    push Z
    push V
    push W
    push dword n
    call proc   
    ;Stampa vettore
    xor esi, esi
ciclo_stampa:
    cmp esi, n
    jge uscita
    printw [Z+esi*2]
    inc esi
    jmp ciclo_stampa
uscita:
    exit 0