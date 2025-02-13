@ /0000
START:
    LD PEND      ; Carrega endereço de escrita
    AD DOIS      ; Incrementa 2 para começar em 0x102
    MM PEND      ; Atualiza PEND
    MM SALVA+1   ; Modifica endereço de `MM 0000`

    ; Calcula próximo quadrado
    LD NMENOS    
    ML DOIS      
    AD UM        
    MM NMENOS    

    ; Salva no endereço modificado
SALVA:
    MM 0000      

    ; Verifica limite (63²)
    LD NMENOS    
    SB LMT       
    JZ END       

    JP START     

END:
    HM /000      

@ /0050
NMENOS  K = 0000  
UM      K = 0001  
DOIS    K = 0002  
LMT     K = 3969  
PEND    K = /0100  

@ /0100
    K = 0000  

