;check.nasm

%include "../../utils/utils.nasm"

section .data
    c equ 16
    n equ 12
    V equ 8

section .text
global check
check:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    sub edi, 2                  ;edi = n - 2
    xor esi, esi
    xor bx, bx
.ciclo:
    cmp esi, edi
    jge .ultimo_elem
    mov cx, [eax+esi*2]
    cmp cx, 0
    jl .cond2
    mov dx, [eax+esi*2+4]       ;dx = V[i + 2]
    cmp dx, 0
    jge .avanti
    sub cx, dx
    cmp cx, 4
    jle .avanti
.update:
    inc bx
    jmp .avanti

.cond2:
    mov dx, [eax+esi*2+2]
    cmp dx, 0
    jl avanti
    sub cx, dx
    neg cx
    cmp cx, 2
    jg .update
.avanti:
    inc esi
    jmp .ciclo
.ultimo_elem:
    mov cx, [eax+ esi*2]
    cmp cx, 0
    jge .fine
    mov dx, [eax+esi*2+2]
    cmp dx, 0
    jle .fine
    sub cx, dx
    neg cx
    cmp cx, 2
    jle .fine
    inc bx
.fine:
    mov edx, [ebp+c]
    mov [edx], bx
    popad
    pop ebp
    ret 12