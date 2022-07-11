;proc.nasm

%include "../../utils/utils.nasm"

section .data
    n equ 8
    V equ 10
    c equ 14

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    mov bx, [eax]
    xor esi, esi
.ciclo:
    cmp edi, 1
    jle .fine
    mov cx, [eax+edi*2]
    mov dx, cx
    shl cx, 2
    cmp bx, cx
    jle .avanti
    mov [eax], dx
    mov [eax+2], bx
    inc esi
.avanti:
    mov bx, dx
    add eax, 2
    dec edi
    jmp .ciclo
.fine
    mov eax, [ebp+c]
    mov [eax], esi
    popad
    pop ebp
    ret 10