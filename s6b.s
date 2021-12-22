.include "macros.s"
.include "crt0.s"
.data

    x: .word 0,1, 2, 3, 4, 5, 6, 7, 8, 9
    y: .word 0,1, 2, 3, 4, 5, 6, 7, 8, 9
    z: .fill 10, 2, 0
    C: .word 3
.text
print: ;IMPRIME R0 EN LA FILA F
    $MOVEI R1,15 ;ComptadoR/FILES
    $MOVEI R5,C
    LD R5,0(R5)
    $MOVEI R2,-3
	SHA R0,R0,R2
    
buc:
	
    $MOVEI R2,0x0001
    AND R2,R2,R0
    $MOVEI R3,48
    ADD R2,R2,R3

    OUT Rdat_pant, R2

    OUT Rfil_pant, R5
    ADDI R1,R1,-1
    OUT Rcol_pant, R1
    $MOVEI R2, 0x8000
    OUT Rcon_pant, R2
    
    $MOVEI R3,-1
    SHL R0,R0,R3


    $MOVEI R2,6
    $CMPEQ R2,R1,R2
    BZ R2,buc


fi_pr:
    JMP R6

printy: ;IMPRIME R0 EN LA FILA F
    $MOVEI R1,30 ;ComptadoR/FILES
    $MOVEI R5,C
    LD R5,0(R5)
    $MOVEI R2,-3
	SHA R0,R0,R2
    
buc2:
	
    $MOVEI R2,0x0001
    AND R2,R2,R0
    $MOVEI R3,48
    ADD R2,R2,R3

    OUT Rdat_pant, R2

    OUT Rfil_pant, R5
    ADDI R1,R1,-1
    OUT Rcol_pant, R1
    $MOVEI R2, 0x8000
    OUT Rcon_pant, R2
    
    $MOVEI R3,-1
    SHL R0,R0,R3


    $MOVEI R2,21
    $CMPEQ R2,R1,R2
    BZ R2,buc2


fi_pr2:
    JMP R6



printz: ;IMPRIME R0 EN LA FILA F
    $MOVEI R1,45 ;ComptadoR/FILES
    $MOVEI R5,C
    LD R5,0(R5)
    $MOVEI R2,-3
	SHA R0,R0,R2
    
buc3:
	
    $MOVEI R2,0x0001
    AND R2,R2,R0
    $MOVEI R3,48
    ADD R2,R2,R3

    OUT Rdat_pant, R2

    OUT Rfil_pant, R5
    ADDI R1,R1,-1
    OUT Rcol_pant, R1
    $MOVEI R2, 0x8000
    OUT Rcon_pant, R2
    
    $MOVEI R3,-1
    SHL R0,R0,R3


    $MOVEI R2,36
    $CMPEQ R2,R1,R2
    BZ R2,buc3


fi_pr3:
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
	ADDI R6,R0,0
    $PUSH R1, R2, R3, R4, R5, R6, R7
    
    $CALL R6, print
    $POP R7, R6, R5, R4, R3, R2, R1
	ADDI R0,R6,0
    $MOVEI R5,C
    LD R5,0(R5)
    ADDI R5,R5,1
    $MOVEI R6,C
    ST 0(R6),R5
    ADDI R0,R0,2
    ADDI R2,R2,2
    CMPEQ R3,R2,R4
    BZ R3,w2
    
    
    $MOVEI R6,C
    $MOVEI R1,3
    ST 0(R6),R1
    
    $MOVEI R1,y
    $MOVEI R4,20
    ADDI R0,R1,0
    $MOVEI R2,0
w3: 
	ADDI R6,R0,0
    $PUSH R1, R2, R3, R4, R5, R6, R7
    
    $CALL R6, printy
    $POP R7, R6, R5, R4, R3, R2, R1
	ADDI R0,R6,0
    $MOVEI R5,C
    LD R5,0(R5)
    ADDI R5,R5,1
    $MOVEI R6,C
    ST 0(R6),R5
    ADDI R0,R0,2
    ADDI R2,R2,2
    CMPEQ R3,R2,R4
    BZ R3,w3
    
    
    
    
    $MOVEI R6,C
    $MOVEI R1,3
    ST 0(R6),R1
    
    $MOVEI R1,z
    $MOVEI R4,20
    ADDI R0,R1,0
    $MOVEI R2,0
w4: 
	ADDI R6,R0,0
    $PUSH R1, R2, R3, R4, R5, R6, R7
    
    $CALL R6, printz
    $POP R7, R6, R5, R4, R3, R2, R1
	ADDI R0,R6,0
    $MOVEI R5,C
    LD R5,0(R5)
    ADDI R5,R5,1
    $MOVEI R6,C
    ST 0(R6),R5
    ADDI R0,R0,2
    ADDI R2,R2,2
    CMPEQ R3,R2,R4
    BZ R3,w4
    
    
    


fi:









HALT
