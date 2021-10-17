.include "macros.s"
.include "crt0.s"

.text
main:
	OUT Rcon_imp,	R0	
	
do:	
	IN R5,Rest_imp
	BZ R5,do
	
	$MOVEI R1,'F
	OUT Rdat_imp,R1
	$MOVEI R4,0x8000 
	OUT Rcon_imp, R4	;Poner en marcha+encuesta
	
do2:	
	IN R5,Rest_imp
	BZ R5,do2
	
	$MOVEI R1,'i
	OUT Rdat_imp,R1
	$MOVEI R4,0x8000 
	OUT Rcon_imp, R4	;Poner en marcha+encuesta
	
do3:	
	IN R5,Rest_imp
	BZ R5,do3
	
	HALT

	

	
		

