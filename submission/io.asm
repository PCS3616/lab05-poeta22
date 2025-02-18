@ /0000
START   GD /000    	; Lê os dois dígitos de X
        SB TT      	; Converte ASCII para decimal (X - 0x3030)
        MM VARX    	; Armazena X convertido
        GD /000    	; Lê espaço (ignorar)
        GD /000   	; Lê os dois dígitos de Y
        SB TT     	; Converte ASCII para decimal (Y - 0x3030)
        MM VARY   	; Armazena Y convertido
        AD VARX    	; Soma X + Y
        MM SOMA    	; Armazena o resultado

        ; Extraindo o dígito menos significativo
        DV DEZES   	; Divide por 10 (hex) para pegar a parte mais significativa
        ML DEZES  	; Multiplica de volta para reconstruir a dezena
        MM TEMP    	; TEMP agora tem a parte alta (exemplo: 60 de 6B)

        LD SOMA
        SB TEMP    	; Subtrai a parte alta para obter o último dígito
        MM MENOS   	; Armazena o dígito menos significativo

        ; Verifica se precisa de "vai-um"
        LD MENOS
        SB A       	; Se MENOS >= A (10 decimal), precisa do ajuste
        JN NO_CARRY  	; Se negativo, pular ajuste

        ; Ajuste do "vai-um"
        LD SOMA
        SB A       	; Subtrai 0x000A
        AD CEM     	; Soma 0x0100 para carregar o "vai-um"
        MM SOMA    	; Armazena o novo resultado		

NO_CARRY:
        LD SOMA
        AD TT     	; Converte de volta para ASCII (soma 0x3030)
        MM SOMA
        PD SOMA   	; Imprime SOMA corretamente
        HM /000   	; Finaliza

@ /0200
VARX    K /0000
VARY    K /0000
SOMA    K /0000
DEZES   K /0010  ; Valor 10 decimal para divisão/multiplicação
TEMP    K /0000
A       K /000A  ; Valor 10 decimal
MENOS   K /0000
CEM     K /0100  ; Para o "vai-um"
TT      K /3030  ; Para conversão decimal -> ASCII

