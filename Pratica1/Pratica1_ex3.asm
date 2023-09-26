	org 00h;Criar um novo programa
;Colocar a origem no endereço 00h
;Inicializar o programa com uma label
;Mover de forma imediata para o ACC e para B dois valores em binário (8 bits), distintos (evitar escolher valores em que todos os dígitos são iguais: 11111111 ou 00000000, por ex., e escolher de forma que pelo menos 1 bit seja igual na mesma posição entre os dois valores. Por ex.: ambos compartilham bit 1 no dígito menos significativo ou em alguma outra posição).
;Realizar AND lógico entre A e B
;Rotacionar A à direita em 2 bits.
;Realizar o complemento de A
;Rotacionar A à esquerda em 2 bits.
;Realizar OR lógico entre A e B
;Realizar XOR entre A e B
;Realizar SWAP de A;
;Saltar para a label inicial
;Encerrar o programa.
;Em “bit field information” no simulador EdSim51 (onde geralmente é exibido PSW no formato binário), colocar ACC no lugar de PSW.
