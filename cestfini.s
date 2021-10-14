.include "macros.s"
.include "crt0.s"
.data
	w: .word 0x8888

.text
main:
	$MOVEI R0,w
	LD R0,0(R0)
main2:
	XOR R1,R1,R1
	XOR R2,R2,R2
	XOR R3,R3,R3
	XOR R4,R4,R4
	XOR R5,R5,R5
	XOR R6,R6,R6
	XOR R7,R7,R7
	;SHOW W
	
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
	ADDI R0,R5,0
	XOR R1,R1,R1
	XOR R2,R2,R2
	XOR R3,R3,R3
	XOR R4,R4,R4
	XOR R5,R5,R5
	XOR R6,R6,R6
	XOR R7,R7,R7
				;RESP A R0
	MOVI R1,0
	OUT Rcon_tec,R1
	$MOVEI R3,tteclat
	MOVI R4,'0'
do:
	IN R1,Rest_tec
	BZ R1,do
	
	IN R1,Rdat_tec
	ADD R1,R3,R1
	LDB R1,0(R1)	;R1=CODIGO AASCIII pulsao
	
	$MOVEI R2,'A'
	$MOVEI R3,'B'
	$MOVEI R4,'C'
	$MOVEI R5,'D'
	$MOVEI R6,'9'
	
teclat:
	;A
	CMPEQ R7,R2,R1		;NO CAMBIAR: R0,R7
	BZ R7,fi1
	$MOVEI R1,1
	SHL R0,R0,R1		
		
	BNZ R7,main2
	
	
fi1:
	;B
	CMPEQ R7,R3,R1
	BZ R7,fi2
	$MOVEI R1,-1
	SHL R0,R0,R1	
	
	BNZ R7,main2
fi2:	

	;C
	CMPEQ R7,R4,R1
	BZ R7,fi3
	$MOVEI R1,-1
	SHA R0,R0,R1	
	
	BNZ R7,main2
fi3:	
	;D
	CMPEQ R7,R5,R1
	BZ R7,fi4
	$MOVEI R1,2	
	DIV R0,R0,R1	
	BNZ R7,main2
	
fi4:	
	$CMPLE R7,R1,R6 			;NUMEROS
	BZ R7,fi5
	$MOVEI R4,'0'
	$CMPGE R7,R1,R4	
	BZ R7,fi5
	
	MOVI R2,1
	SHL R2,R2,R1
	ADDI R2,R2,-1
	XOR R0,R0,R2	
	BNZ R7,main2
fi5:
	
	
	HALT
