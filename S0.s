.include "macros.s"
.include "crt0.s"
.data
	str1: .byte 'A','q','u','e','s','t','p','r','o','g','r','a','m','a',' ','f','u','n','c','i','o','n','a','0'
	.fill 5,1,0 ; .fill cuantes posicions, mida en bytes, de que l'omplo


.text

main:
	
	
	$MOVEI R1,str1		;R1=STR[0]
	xor r0,r0,r0
do:	
				;;;;;;TENGO Q PONER UN WHILE R1!='0
	OUT Rcon_imp,	R0  ;equesta
	LDB R3,0(R1)
	$MOVEI R2,'0'
	$CMPEQ r6,r3,r2
	BNZ R6,do3
esp:			
	IN R5,Rest_imp		
	BZ R5,esp
				
	OUT Rdat_imp,R3
	$MOVEI R4,0x8000 
	OUT Rcon_imp, R4	;Poner en marcha+encuesta
	ADDI R1,R1,1
	BZ R6,do
	
	
	
do3:	
	IN R5,Rest_imp
	BZ R5,do3

	HALT

	

	
		

