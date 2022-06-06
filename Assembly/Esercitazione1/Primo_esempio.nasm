; Come sommare fra loro tutti gli elementi di un array

SECTION .DATA
X DD 12, 4, 2, -6, -5, 1
N EQU ($-X)/4        ;siccome usiamo double word usiamo 4 celle di memoria

SECTION .BSS
S RESD 1

SECTION .TEXT
GLOBAL_START
_START:
    MOV EAX, 0
    MOV ESI, 0
CICLO:
    CMP ESI, N	  ;(i<n)?
    JGI FINE
    ADD EAX, [X+4*ESI]
    INC ESI
    JMP CIC LO
FINE:
    MOV [S], EAX
