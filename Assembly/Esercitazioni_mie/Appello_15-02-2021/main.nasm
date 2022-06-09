;Sia dato un vettore di word V contenente informazioni riguardanti le temperature
;massime e minime rilevate in n città.
;Dunque, sia V un vettore di dimensione 2*n in cui ciascun elemento in posizione
;pari contiene la temperatura minima in una certa città e l’elemento immediatamente
;successivo contiene la temperatura massima rilevata nella stessa città.
;Scrivere una procedura Assembly che calcola e restituisce un vettore di word W
;formato da due elementi e costruito come segue:
;1) W[0] contiene la massima escursione termica (differenza tra temperatura massima
;e minima rilevate in una stessa città);
;2) W[1] contiene l’escursione termica media.
;Si scriva, inoltre, un programma principale che invochi correttamente la procedura
;descritta.
;
;Gli elementi di W sono calcolati come segue:
;W[0] = max{(10-8),(5-0),(3-(-1)),(3-(-4)),(12-7)} = max{2,5,4,7,5} = 7
;W[1] = [(10-8)+(5-0)+(3-(-1))+(3-(-4))+(12-7)]/5 = 23/5 = 4

%include "../../utils/utils.nasm"

section .data
    V dw 8, 10, 0, 5, -1, 3, -4, 3, 7, 12
    nV equ ($-V)/2

section .bss
    W resw 2

section .text
global _start
extern escursione_termica
_start:
    push W
    push V
    push word nV
    call escursione_termica
    printw word [W]
    printw word [W+2]
    exit 0