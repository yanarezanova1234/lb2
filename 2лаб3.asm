%include "io.inc"

section .text
global CMAIN
CMAIN:
    LEA ESI, [a]        ;ESI = i
    LEA EDX, [ESI]
    LEA EDI, [ESI+5]    ;EDI = n
Fori:
    CMP EDI, ESI        ;For i in range(n-1)
    JE Exit         
    MOV EBX, EDI
    DEC EBX             ;EBX = j 
Forj:
    CMP EBX, ESI        ;For j in range(n-1, i)
    JA Next             
    INC ESI
    JMP Fori
Next:
    MOV AH, [EBX]       ;AH = a[j]
    MOV AL, [EBX-1]     ;AL = a[j-1]
    CMP AH, AL
    JA L1               ;If not a[j] < a[j-1]
    MOV [EBX], AL
    MOV [EBX-1], AH
L1:
    DEC EBX
    JMP Forj
Exit:
    PRINT_DEC 1, [EDX]
    NEWLINE
    INC EDX
    CMP EDI, EDX
    JA Exit
    RET  
    
section .data
a: db 2, 14, 94, 50, 30