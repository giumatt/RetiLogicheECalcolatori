;proc.nasm

%import "../../utils/utils.nasm"

section .data
    c equ 16
    V equ 12
    n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    xor esi, esi
    xor dx, dx
.ciclo:
    cmp esi, edi
    jge fine
    mov bx, [eax+esi*2]             ;leggo V[i]
    mov ecx, esi
    dec ecx                         ;definisco un indice j = i-1
.ciclo_2:
    cmp ecx, 0
    jl .fine_2
    cmp bx, [eax+ecx*2]             ;V[i] == V[j] ? se j < i
    je non_contare
    dec ecx
    jmp ciclo_2
.fine_2:
    inc dx
.non_contare:
    inc esi
    jmp ciclo
fine:
    mov eax, [ebp+c]
    mov [eax], bx
    popad
    pop ebp
    ret 12