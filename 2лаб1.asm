%include "io.inc"

section .text
global CMAIN
CMAIN:
    XOR ECX, ECX   
    LEA EBX, [a]
    MOV EDI, 5
    MOV ESI, 0
    MOV AH, [k]         ;заданное значение
Next:
    CMP EDI, ESI
    je Exit
    MOV AL, [EBX+ESI]
    CMP AL, AH
    JA Label1
    INC ESI
    JMP Next
Label1:
    INC ECX
    INC ESi
    JMP Next
    
Exit:
    PRINT_DEC 4, ECX
    RET
    
section .data
a: db 10, 2, 13, 24, 35
k: db 13 