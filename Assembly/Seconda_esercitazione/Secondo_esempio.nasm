;Dato un vettore x di lunghezza N, per ogni i t.c. 0 <= i <= N - 1,
;se x[i] > x[i+1] allora sostituiremo x[i] con la differenza tra l'elemento
;in posizione i e l'elemento in posizione i+1

%include "../utils/utils.nasm"

section .data
    x dw 10, -3, -7, 11, -2
    n equ ($-x)/2

section .text
global _start
_start:
    xor esi, esi
ciclo:
    cmp esi, n-1
    jge fine
    mov ax, [x+2*esi]       ;x[i]
    mov bx, [x+2*esi+2]     ;x[i+1]
    cmp ax, bx
    jle no
    sub ax, bx              ;ax <--- x[i] - x[i+1]
    mov [x+2*esi], ax       ;x[i] = x[i] - x[i+1]
no:
    inc esi
    jmp ciclo
fine:
    exit 0