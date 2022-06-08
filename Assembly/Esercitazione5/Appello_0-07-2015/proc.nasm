;proc.nasm

%include "../../utils/utils.nasm"

section .data
    T equ 20
    nT equ 18
    V equ 14
    W equ 10
    n equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    ;inizializzazione
    mov eax, [ebp+V]            ;carico indir di partenza V
    mov ebx, [ebp+W]            ;carico indir di partenza W
    movzx edi, word [ebp+n]            ;carico n in edi
    mov ecx, [ebp+T]
    xor esi, esi
.ciclo:
    cmp esi, edi
    jge fine
    ror esi, 1
    jc .dispari                 ;l'indice è dispari
    rol esi, 1
    mov dx, [eax+esi*2]
    add dx, [ebx+esi*2]         ;somma tra i due elementi pari
    mov [ecx], dx
    add ecx, 2
    jmp .continua
.dispari:
    mov dx, [eax+esi*2]
    mov [ecx], dx
    mov dx, [ebx+esi*2]
    add ecx, 2
    mov [ecx], dx
.continua:
    add ecx, 2
    inc esi
    jmp .ciclo
fine:
    popad
    pop ebp
    ret 16