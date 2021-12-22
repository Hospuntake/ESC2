include "macros.s"
.include "crt0.s"
.data

    x: .word 0,1, 2, 3, 4, 5, 6, 7, 8, 9
    y: .word 0,1, 2, 3, 4, 5, 6, 7, 8, 9
    z: .fill 10, 2, 0
    C: .word 0
.text
print: ;IMPRIME R0 EN LA FILA F
    $MOVEI R1,0 ;ComptadoR/FILES
    $MOVEI R5,C
    LD R5,0(R5)
    
buc:
    $MOVEI R2,0x0001
    AND R2,R2,R0
    $MOVEI R3,48
    ADD R2,R2,R3

    OUT Rdat_pant, R2

    OUT Rfil_pant, R1
    ADDI R1,R1,1
    OUT Rcol_pant, R5
    $MOVEI R2, 0x8000
    OUT Rcon_pant, R0
    
    $MOVEI R3,-1
    SHL R0,R0,R3

    ADDI R1,R1,1
    $MOVEI R2,9
    $CMPEQ R2,R1,R2
    BZ R2,buc


fi_pr:
    JMP R6



main:

    $MOVEI R4,x
    ADDI R4,R4,20
    $MOVEI R1,x
    $MOVEI R2,y
    $MOVEI R3,z

while:
    
    LD R0,0(R1)        ;R0,R5 PA USAR
    LD R5,0(R2)
    ADD R5,R5,R0
    ST 0(R3),R5    
    
    ADDI R1,R1,2
    ADDI R2,R2,2
    ADDI R3,R3,2
    CMPEQ R6,R4,R1
    BZ R6 ,while


    $MOVEI R1,x
    $MOVEI R4,20
    ADDI R0,R1,0
    $MOVEI R2,0
w2: 
    $PUSH R1, R2, R3, R4, R5, R6, R7
    $CALL R6, print
    $POP R7, R6, R5, R4, R3, R2, R1

    $MOVEI R5,C
    $LD R5,(0)R5
    ADDI R5,R5,1
    $MOVEI R6,C
    ST R6,0(R5)
    ADDI R0,R0,2
    ADDI R2,R2,2
    CMPEQ R3,R2,R4
    BZ R3,w2


fi:









HALT
