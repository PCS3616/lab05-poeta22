@ /0000
START	LD PEND      ; Carrega endereço de escrita    
	AD DOIS      ; Incrementa 2 para começar em 0x102
    	MM PEND      ; Atualiza PEND
    	MM SALVA     ; Modifica endereço de `MM 0000`

    	; Calcula próximo N
    	LD CONT
    	ML DOIS
    	AD UM
    	AD SOMA
    	MM SOMA
    	
    	; Salva a SOMA no endereço modificado
SALVA	k /0000 
    	
    	;Atualiza contador
    	LD CONT
    	AD UM
    	MM CONT    

	; Verifica limite (63²)
	LD LMT    
	SB SOMA       
	JN END       
	JP START 
	
@ /0040
END	HM /000      

@ /0050
CONT	K =0  
UM      K =1  
DOIS    K =2  
LMT     K =3969
PEND    K /9100 
SOMA	K =0;

@ /0100
	K =0000  
