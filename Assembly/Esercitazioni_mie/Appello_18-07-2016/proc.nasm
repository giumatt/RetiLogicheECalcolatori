;proc.nasm

%include "../../utils/utils.nasm"

section .data
    V equ 8
    W equ 12
    T equ 16
    n equ 20
 
 section .text
 global proc
 proc:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov ebx, [ebp+W]
    mov ecx, [ebp+T]
    mov edi, [ebp+n]
    xor esi, esi
.ciclo:
    cmp esi, edi
    jge .fine
    mov dx, [eax+2*esi]         ;prendo V[i]
    and dx, 1                   ; A AND B = A MOD 2 e restituisce il resto -> V[i] pari?
    jnz .dispari
    mov dx, [ebx+2*esi]         ;prendo W[i]
    and dx, 1                   ;W[i] pari?
    jnz .dispari
    mov dx, [eax+2*esi]
    mov [ecx+4*esi], dx         ;T[2*i] = V[i]
    mov dx, [ebx+2*esi]
    mov [ecx+4*esi+2], dx       ;T[2*i+1] = W[i]
    inc esi
    jmp .ciclo
.dispari
    mov dx, [eax+2*esi]
    neg dx
    mov [ecx+4*esi], dx
    mov dx, [ebx+2*esi]
    neg dx
    mov [ecx+4*esi+2], dx
    inc esi
    jmp .ciclo
.fine:
    popad
    mov esp, ebp
    pop ebp
    ret 16