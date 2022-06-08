;verifica.nasm

%include "../../utils/utils.nasm"

section .data
    A equ 8
    nA equ 12
    B equ 14
    nB equ 18
    ris equ 20

section .text
global verifica
verifica:
    push ebp
    mov ebp, esp
    pushad
    ;carico indir di partenza di A e di B
    mov eax, [ebp+A]
    mov ebx, [ebp+B]
    mov dx, [eax]
    movzx edx, dx               ;estendiamo con degli zeri per poter utilizzare il valore per l'indirizzamento
    ;movzx edx, word [eax] è equivalente a queste ultime due istruzioni
    mov cx, [ebx+edx*2]
    mov di, [ebp+nA]
    dec di
    add eax, 2                  ;puntiamo al prossimo elemento
.ciclo:
    cmp di, 0
    jle .end_true                ;di <= 0
    movzx edx, word [eax]
    mov si, [ebx+edx*2]
    ;verifichiamo se B[A[i+1]] < B[A[i]]
    cmp si, cx
    jl .end_false
    mov cx, si
    dec di
    add eax, 2
    jmp ciclo
.end_true:
    mov al, 1
    jmp esci
.end_false:
    mov al, 0
esci:
    mov ebx, [ebp+ris]          ;carico l'indirizzo del risultato
    mov [ebx], al
    popad
    pop ebp
    ret 16