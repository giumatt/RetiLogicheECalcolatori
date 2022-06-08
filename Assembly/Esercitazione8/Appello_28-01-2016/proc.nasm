;proc.nasm

%include "../../utils/utils.nasm"

section .data
    ret equ 18
    V equ 14
    n equ 10
    k equ 8

section .text
global proc
proc:
    push ebp
    mov ebp, esp
    pusad
    mov eax, [ebp+V]
    mov edi, [ebp+n]
    sub edi, 2
    mov bx, [ebp+k]
    xor esi, esi
.ciclo:
    cmp esi, edi
    jge fine
    mov cx, [eax+esi*2]
    ;controllo se il valore sia pos o neg
    shr cx, 1
    ;controllo se la terna sia composta da numeri pari
    jc .continua
    mov cx, [eax+esi*2+2]
    shr cx, 1
    jc .continua
    mov cx, [eax+esi*2+4]
    shr cx, 1
    jc .continua
    ;sommo i tre elementi
    mov dx, [eax+esi*2]
    add dx, [eax+esi*2+2]
    add dx, [eax+esi*2+4]
    ;confronto la somma con k
    cmp dx, bx
    jle .continua
    mov cx, 1
    jmp terminazione
.continua:
    inc esi
    jmp .ciclo
.terminazione:
    mov cx, 0
fine:
    mov [ebp+ret], cx
    popad
    pop ebp
    ret 14