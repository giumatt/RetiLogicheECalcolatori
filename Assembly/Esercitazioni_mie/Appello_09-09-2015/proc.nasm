;proc.nasm

%include "../../utils/utils.nasm"

section .data
    A equ 8
    nA equ 12
    B equ 14
    nB equ 18
    ris equ 20

section .text
global proc
proc:
    mov ebp, esp
    push ebp
    pushad
    mov eax, [ebp+A]
    mov ebx, [ebp+B]
    mov dx, [eax]
    movzx edx, dx
    mov cx, [ebp+edx*2]
    mov di, [ebp+nA]
    dec di 
    add eax, 2
.ciclo:
    cmp di, 0
    jle .end_true
    movzx edx, word [eax]
    mov si, [ebx+edx*2]
    cmp si, cx
    jl .end_false
    mov cx, si
    dec di
    add eax, 2
    jmp .ciclo
.end_true:
    mov al, 1
    jmp fine
.end_false:
    mov al, 0
fine:
    mov ebx, [ebp+ris]
    mov [ebx], al
    popad
    pop ebp
    ret 16