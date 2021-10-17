.include "macros.s"
.include "crt0.s"
.data
	w: .word 0x8888

.text

main:
	$MOVEI R0,w
	LD R0,0(R0)
	ADDI R5,R0,0
	$MOVEI R1,15
	$MOVEI R2,0
	OUT Rfil_pant,R2
	$MOVEI R6,0x8000
	$MOVEI R2,-1
while:	
	CMPEQ R7,R1,R2
	bnz r7,fi
	OUT Rcol_pant,R1
	$MOVEI R3,0x0001
	and R4,R3,R0
	$MOVEI R3,'0'
	ADD R4,R4,R3
	OUT Rdat_pant,R4
	OUT Rcon_pant, R6
	
	SHL R0,R0,R2
	add r1,r1,r2
	bz r7,while
	
fi:
	
	
	
	HALT
	
	
	
	
	
	
	
	
	
	
	
