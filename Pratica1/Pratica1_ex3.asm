	org 00h;Criar um novo programa
;Colocar a origem no endere�o 00h
;Inicializar o programa com uma label
;Mover de forma imediata para o ACC e para B dois valores em bin�rio (8 bits), distintos (evitar escolher valores em que todos os d�gitos s�o iguais: 11111111 ou 00000000, por ex., e escolher de forma que pelo menos 1 bit seja igual na mesma posi��o entre os dois valores. Por ex.: ambos compartilham bit 1 no d�gito menos significativo ou em alguma outra posi��o).
;Realizar AND l�gico entre A e B
;Rotacionar A � direita em 2 bits.
;Realizar o complemento de A
;Rotacionar A � esquerda em 2 bits.
;Realizar OR l�gico entre A e B
;Realizar XOR entre A e B
;Realizar SWAP de A;
;Saltar para a label inicial
;Encerrar o programa.
;Em �bit field information� no simulador EdSim51 (onde geralmente � exibido PSW no formato bin�rio), colocar ACC no lugar de PSW.
