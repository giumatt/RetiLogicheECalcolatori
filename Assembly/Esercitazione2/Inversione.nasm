;Inversione di una stringa

%include "../utils/utils.o"

section .data
    str db 'ciao'
    n equ $-str

section .text
global _start
_start:
    xor esi, esi
    mov edi, n-1
ciclo:
    cmp esi, edi
    jge fine
    lea ebx, [str+esi]
    lea ecx, [str+edi]
    ;scambio
    mov al, [ebx]       ;al <--- 'c'
    xchg al, [ecx]      ;al <--- 'o' [ecx] <--- 'c'
    mov [ebx], al       ;[ebx] <--- 'o'
    inc esi
    dec edi
    jmp ciclo
fine:
    exit 0