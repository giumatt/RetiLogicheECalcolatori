;Dati due array x e y aventi lunghezza N, costruire due array che contengano
;rispettivamente per ogni i t.c. 0 <= i <= N - 1 il quoziente ed il resto della
;divisione tra x[i] e y[i].

%include "../utils/utils.nasm"

section .data
    x dw 10, -3, -7, 11, -2
    y dw -2, -4, 6, 20, -1
    n equ ($-y)/2

section .bss
    z resw n
    w resw n

section .text
global _start
_start:
    xor esi, esi
ciclo:
    cmp esi, n
    jge fine
    mov ax, [x+2*esi]
    cwd
    mov bx, [y+2*esi]
    idiv bx
    mov [z+2*esi], ax
    mov [w+2*esi], dx
    inc esi
    jmp ciclo
fine:
    exit 0