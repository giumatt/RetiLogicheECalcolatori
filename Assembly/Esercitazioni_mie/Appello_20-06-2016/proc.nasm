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
    add eax, edi            ; V + n/2
    shr edi, 1              ; edi = n/2
    xor esi, esi
.ciclo_1:
    cmp esi, edi
    jge fine_ciclo_1
    mov cx, [ebx+esi*2]     ; cx = W[i]
    mov dx, [eax+esi*2]     ; dx = V[n/2 + i]
    cmp cx, dx              ; W[i] > V[n/2 + i] ?
    jle .cond1_falsa
    add dx, cx              ; dx = W[i] + V[n/2 + i]
    jmp .avanti_1
.cond1_falsa:
    xor cx, cx
.avanti_1:
    mov [ebx+esi*2], cx
    inc esi
    jmp .ciclo_1
.fine_ciclo_1:
    mov eax, [ebp+V]
    lea ebx, [ebx+edi*2]    ; W + n/2
    sub eax, edi
.ciclo_2:
    cmp esi, edi            ; i < n/2 ?
    jge .fine_ciclo_2
    mov cx, [ebx+esi*2]
    mov dx, [eax+esi*2]     ; dx = W[i + n/2]
    cmp cx, dx
    jle .cond2_falsa        
    add cx, dx              ; cx = W[i + n/2] + V[i]
    jmp avanti_2
.cond2_falsa:
    xor cx, cx
.avanti_2:
    mov [ebx+2*esi], cx
    inc esi
    jmp .ciclo_2
.fine_ciclo_2:
    popad
    pop ebp
    ret 12