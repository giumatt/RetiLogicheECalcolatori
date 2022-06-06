;for (i=0, j=n-1; i<j; i++, j++)
;   swap(str[i], str[j]);

%include "utils/utils.nasm"

SECTION .DATA
STR DB 'roma'
n EQU $-STR

SECTION .TEXT
GLOBAL _START
_START:
    ;Inizializzazione variabili
    XOR ESI, ESI    ;i=0
    MOV EDI, n-1    ;j=n-1
CICLO:
    CMP ESI, EDI
    JGE FINE
    MOV AL, [STR+ESI]
    XCHG AL, [STR+EDI]
    MOV [STR+ESI], AL
    INC ESI
    DEC EDI
    JMP CICLO
FINE:
    PRINTB STR, n
    EXIT 0