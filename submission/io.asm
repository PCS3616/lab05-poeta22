      	@  /100
        GD /000     ; Lê os dois números do teclado (ASCII)
        MM NUM1     ; Armazena o primeiro número
        GD /000     ; Lê o segundo número
        MM NUM2     ; Armazena o segundo número
        
        LD NUM1     ; Carrega o primeiro número
        SB OFFSET   ; Remove offset ASCII (subtrai 0x3030)
        MM NUM1     ; Armazena de volta
        
        LD NUM2     ; Carrega o segundo número
        SB OFFSET   ; Remove offset ASCII (subtrai 0x3030)
        MM NUM2     ; Armazena de volta
        
        LD NUM1     ; Carrega NUM1
        AD NUM2     ; Soma NUM1 + NUM2
        MM RESULT   ; Armazena o resultado
        
        LD RESULT   ; Carrega o resultado
        AD OFFSET   ; Converte para ASCII
        PD /100     ; Imprime o resultado
        
        HM /000     ; Fim do programa

        @  /200
NUM1    K /0000    ; Armazena o primeiro número
NUM2    K /0000    ; Armazena o segundo número
RESULT  K /0000    ; Armazena o resultado
OFFSET  K /3030    ; Offset para conversão ASCII

