@ /0000
START	LD PEND      ; Carrega endereço de escrita    
	AD DOIS      ; Incrementa 2 para começar em 0x102
    	MM PEND      ; Atualiza PEND
    	MM SALVA   ; Modifica endereço de `MM 0000`

    	; Calcula próximo quadrado
    	LD NMENOS    
    	ML DOIS      
    	AD UM        
    	MM NMENOS    

    	; Salva no endereço modificado
SALVA	k /0000      

	; Verifica limite (63²)
	LD NMENOS    
	SB LMT       
	JZ END       
	JP START     

END	HM /000      

@ /0050
NMENOS	K =0  
UM      K =1  
DOIS    K =2  
LMT     K =3969  
PEND    K /9100  

@ /0100
	K =0000  

