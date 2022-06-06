%include "utils/utils.nasm"

SECTION .DATA
X DW 12, 4, 2, -6, -5, 1
N EQU ($-X)/4

SECTION .TEXT
GLOBAL _START
_START:
    MOV EAX, 0
    MOV ESI, 0
CICLO:
    CMP ESI, N
    JGE FINE
    MOVSX EBX, WORD[X+2*ESI]    ;EBX <---- estensione della word memorizzata a partire da x+2*esi
    ADD EAX, EBX
    INC ESI
    JMP CICLO
FINE:
    printd EAX
    exit 0