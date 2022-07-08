;escursione_termica.proc

section .data
    W equ 14
    V equ 10
    nV equ 8

section .text
global escursione_termica
escursione_termica:
    push ebp
    mov ebp, esp
    pushad
    mov edx, [ebp+V]        ;Temp minima prima città
    mov ecx, [ebp+W]
    mov di, [ebp+nV]
    mov bx, [edx+2]         ;Temp max prima città
    sub bx, [edx]           ;Escursione termica prima città
    add edx, 4              ;Mi sposto sulla temp minima della seconda città
    mov si, bx              ;si = esc max corrente
    mov ax, bx              ;ax conterrà la somma delle esc termiche delle città
    shr di, 1               ;di = num città (n/2)
    dec di                  ;La prima coppia è stata già elaborata
.ciclo:
    cmp di, 0
    jle .fine_ciclo
    mov bx, [edx+2]
    sub bx, [edx]
    add ax, bx
    cmp si, bx              ;agg max
    jge .final
    mov si, bx
.final:
    add edx, 4
    dec di
    jmp .ciclo
.fine_ciclo:
    mov [ecx], si           ;spostamento del max trovato in W[0]
    xor dx, dx
    mov edi, [ebp+nV]
    shr di, 1
    idiv di
    mov [ecx+2], ax
    popad
    pop ebp
    ret 10