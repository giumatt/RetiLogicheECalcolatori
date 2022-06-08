;proc.nasm

%include "../../utils/utils.nasm"

section .data
    V equ 8
    W equ 12
    n equ 16

section .text
global somma
somma:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov ebx, [ebp+W]
    mov edi, [ebp+n]
    add eax, edi
    shr edi, 1
    xor esi, esi
.ciclo_1:
    cmp esi, edi
    jge fine_ciclo_1
    mov cx, [ebx+esi*2]
    mov dx, [eax+esi*2]
    cmp cx, dx
    jle .cond1_falsa
    add dx, cx
    jmp .avanti_1
.cond1_falsa:
    xor cx, cx
.avanti_1:
    mov [ebx+esi*2], cx
    inc esi
    jmp .ciclo_1
.fine_ciclo_1:
    mov eax, [ebp+V]
    sub eax, edi
.ciclo_2:
    cmp esi, edi
    jge   
