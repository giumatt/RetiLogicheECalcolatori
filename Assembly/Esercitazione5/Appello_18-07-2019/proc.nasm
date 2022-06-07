;proc.nasm

%include "../../utils/utils.nasm"

section .data
    c equ 15
    V equ 11
    n equ 9
    k equ 8

section .bss
    cont resw 1

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    ;Calcolo 2^k
    mov cl, [ebp+k]
    mov bx, 2
    shl bx, cl
    mov ecx, [ebp+V]
    mov [cont], word 0
    xor esi, esi
    mov ax, [ecx]               ;ax = V[0]
    movzx edi, [ebp+n]
    dec edi
    add ax, [ecx+edi*2]
    cwd
    idiv bx
    cmp dx, 0
    je .ciclo
    add [cont], word 1
.ciclo:
    cmp esi, edi
    jge fine
    mov ax, [ecx+esi*2]         ;leggo V[i]
    add ax, [ecx+esi*2+2]       ;V[i] + V[i+1]
    cwd
    idiv bx
    cmp dx, 0
    je .continua
    add [cont], word 1
.continua:
    inc esi
    jmp .ciclo
fine:
    mov eax, [ebp+c]
    mov bx, [cont]
    mov [eax], bx
    popad
    mov esp, ebp
    pop ebp
    ret 11