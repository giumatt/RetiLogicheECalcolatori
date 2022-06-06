;getMax.nasm

%include "../../utils/utils.nasm"

section .data
    max equ 16
    V equ 12
    n equ 8

section .text
global getMax
getMax:
    push ebp
    mov ebp, esp
    pushad
    mov eax, [ebp+V]
    mov esi, [ebp+n]
    xor bx, bx              ;bx tiene conto della somma del modulo dei valori pari
    xor cx, cx              ;cx tiene conto della somma del modulo dei valori dispari
    xor edi, edi
.ciclo:
    cmp edi, esi
    jge fine
    mov dx, [eax+edi*2]
    ;verifico la posizione se è pari/dispari
    ror edi, 1
    jnc .posPari
    add cx, dx
.posPari:
    rol edi, 1
    ror dx, 1
    jc .salta
    rol dx, 1
    cmp dx, 0
    jge .aggiungi
    neg dx
.aggiungi:
    add bx, dx
.salta:
    inc edi
    jmp .ciclo
fine:
    cmp bx, cx
    jg scriviMax
    ;decidiamo che il massimo lo memorizziamo in bx
    mov bx, cx

.scriviMax:
    mov [ebp+max], bx
    popad
    pop ebpret 8





;Prossima lezione:
;       https://web.microsoftstream.com/video/3d1b4834-df92-426f-8093-b0294dedd6b9