;proc.nasm

%include "../../utils/utils.nasm"

section .data
    c equ 16
    V equ 12
    n equ 8

section .bss
    ;riservo una word per il contatore
    cont resw 1

section .text
global proc
proc:
    mov [cont], 0
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    ;divido a metà la lunghezza del vettore
    shr edi, 1
    mov bx, [eax+edi*2]         ;prendo l'elemento a metà del vettore
    mov ecx, eax                
    add ecx, edi
    add ecx, 2                  ;indirizzo di partenza della seconda metà del vettore
    xor esi, esi
.ciclo:
    cmp esi, edi
    jge fine                    ;i >= n/2
    mov dx, [eax+esi*2]         ;dx = V[i]
    sub dx, [ecx+esi*2]         ;dx = V[i] - V[i+1+n/2]
    ;controllo se la differenza è pos o neg utilizzando la carry
    rol dx, 1
    jnc .continua
    ror dx, 1
    neg dx
    jmp .continua_2
.continua:
    ror dx, 1
.continua_2:
    cmp dx, bx
    jle .continua_ciclo
    add [cont], 1
.continua_ciclo:
    inc esi
    jmp .ciclo
fine:
    mov eax, [ebp+c]
    mov bx, [cont]
    mov [eax], bx
    popad
    mov esp, ebp
    pop ebp
    ret 12