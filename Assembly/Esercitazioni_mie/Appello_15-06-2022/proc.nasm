;proc.nasm

%include "../../utils/utils.nasm"

section .data
    n equ 8
    h equ 10
    V equ 14
    W equ 18

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov ebx, [ebp+V]
    mov ecx, [ebp+W]
    xor esi, esi
.inizializzazione:
    cmp esi, h
    jge .continua
    mov [ecx], dword 0
    inc esi
    jmp .inizializzazione
.continua:
    xor esi, esi
    mov edi, [ebp+n]
.ciclo:
    cmp esi, edi
    jge .fine
    mov ax, [ebx+esi*2]
    cwd                     ;converte word in doubleword
    div word [ebp+h]
    movzx edx, dx
    inc [ecx+edx*2]
    inc esi
    jmp .ciclo
.fine:
    mov esp, ebp
    pop ebp
    ret 14