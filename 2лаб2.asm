%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA ESI, [a]
    MOV AL, [ESI]
    AND AL, 0xF8
    SHR AL, 3
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    MOV DL, 0x07
    AND BL, DL
    SHL BL, 2
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xC0
    SHR AL, 6
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x3E
    SHR AL, 1
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    AND BL, 0x01
    SHL BL, 4
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xF0
    SHR AL, 4
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    AND BL, 0x0F
    SHL BL, 1
    INC ESI
    MOV AL, [ESI]
    AND AL, 0x80
    SHR AL, 7
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x7C
    SHR AL, 2
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV BL, [ESI]
    AND BL, 0x03
    SHL BL, 3
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xE0
    SHR AL, 5
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x1F
    
    PRINT_DEC 1, AL
    NEWLINE
    RET
section .data
a: db 0x57, 0xD1, 0x64, 0xC3, 0xA8

;Упаковка массива из 8 эл-тов по 5 бит:
; 10    31    8     22    9     16    29    8
; 01010 11111 01000 10110 01001 10000 11101 01000
; 01010111 11010001 01100100 11000011 10101000
; 0x57     0xD1     0x64     0xC3     0xA8