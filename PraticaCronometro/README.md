# Projeto de um cronômetro digital usando Assembly e 8051

## Alunos

Pedro Borges Gudin - 12547997

Mateus Santos Messias - 12548000

Guilherme Castanon Silva Pereira - 11801140

## Código-fonte

```assembly
; Display de 7 segmentos¹[1]
;     ___a___
;   ||-------||
;  f||       ||b
;   ||___g___||
;   ||-------||
;  e||       ||c
;   ||___d___||
;     --------   + DP
; Segmentos conectados aos LEDs da
; PORTA P1
;      DP g f e d c b a
; P1 = 7  6 5 4 3 2 1 0  
; bit = 1(apagado); bit = 0(acende)

; Contagem de 0 a 9
;0= C0h= 11000000b = a,b, c, d, f
;1= F9h= 11111001b = b,c
;2= A4h= 10100100b = a,b, d, e, g
;3= B0h= 10110000b = a,b, c, d, g
;4= 99h= 10011001b = b,c, f, g 
;5= 92h= 10010010b = a,c, d, f, g
;6= 82h= 10000010b = a,c, d, e, f,g
;7= F8h= 11111000b = a, b, c
;8= 80h= 10000000b = a,b,c,d,e,f,g
;9= 90h= 10010000b = a,b,c, d, f, g

org 00h

JMP inicio ; Pula para o início do programa

	org 33h

		; Declaração dos switches (portas 2.0 e 2.1)
SWITCH_0 EQU P2.0
SWITCH_1 EQU P2.1

inicio:
	CLR P3.3 ; Seleciona o Display de sete segmentos mais à esquerda (0 & 0)
	CLR P3.4
	CALL ligar_relogio ; Chama a subrotina para ligar o relógio
JMP inicio ; Loop infinito para manter o programa rodando

ligar_relogio:
		JB SWITCH_0, ligar_relogio ; Se o switch 0 estiver acionado, continua chamando a subrotina para ligar o relógio
		SETB P0.7 ; Ativa decoder dos displays de 7 segmentos (liga)
		MOV A, #0c0h ; Insere o equivalente ao número 0 no acumulador
		MOV P1, A ; Move número para porta 1 (P1.0 a P1.7)
		JB SWITCH_0, desligar_relogio ; Se o switch 0 estiver acionado, chama a subrotina para desligar o relógio
	CALL delay_switch
		MOV A, #0f9h ; Insere o equivalente ao número 1 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #0a4h ; Insere o equivalente ao número 2 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #0b0h ; Insere o equivalente ao número 3 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #099h ; Insere o equivalente ao número 4 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #092h ; Insere o equivalente ao número 5 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #082h ; Insere o equivalente ao número 6 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
CALL delay_switch
		MOV A, #0f8h ; Insere o equivalente ao número 7 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #080h ; Insere o equivalente ao número 8 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 
	CALL delay_switch
		MOV A, #090h ; Insere o equivalente ao número 9 no acumulador
		MOV P1, A
		JB SWITCH_0, desligar_relogio 

RET

desligar_relogio: ; Subrotina para desligar o relógio.
    CLR P0.7 ; Desativa decoder dos displays de 7 segmentos (desliga)¹[1]

RET

delay_switch: ; Subrotina geral de delay
    MOV R0, #250 ; Define tamanho do delay secundário em ms
    JB SWITCH_1, delay_1s ; Se switch não for acionado (bit = 1), pula instruções para subrotina delay_1s
    CALL delay_025s ; Só executa se switch foi acionado (bit = 0)

RET

delay_025s: ; Delay de 250ms ajustado para tempo de instrução

    MOV R2, #248 ; Valores ajustados para considerar tempo de instrução
    MOV R3, #248 ; Valores ajustados para considerar tempo de instrução

    delay_loop_2: DJNZ R2, delay_loop_2 ; Itera 248 vezes (2us * 250)
    delay_loop_3: DJNZ R3, delay_loop_3 ; Itera 248 vezes (2us * 250)

    DJNZ R0, delay_025s ; Itera tudo acima a quantidade de vezes em R0 = (250 * (2 * 500us)) = 250ms

RET

delay_1s: ; Delay de 1s ajustado para tempo de instrução.

    MOV R4, #4 ; Contador de loop para delay de 1s (4 * subrotina de 250ms)

    delay_1s_loop:
        CALL delay_025s ; Chama delay de 250ms ajustado para tempo de instrução
        DJNZ R4, delay_1s_loop ; Decrementa contador de loop e faz loop se não for zero

RET
```

## Diagrama esquemático

- Coloque aqui o diagrama esquemático do circuito montado no EDSim51, mostrando os componentes e as conexões utilizados.
- Por exemplo:

![Diagrama esquemático](diagrama.png)

## Explicação

O programa é escrito em linguagem assembly para o microcontrolador 8051. Ele implementa um cronômetro digital que conta de 0 a 9 segundos e exibe o valor em um display de sete segmentos.

### Estrutura do Programa

O programa começa com a declaração dos switches (portas 2.0 e 2.1) que são usados para controlar o cronômetro. O switch 0 é usado para ligar ou desligar o cronômetro, enquanto o switch 1 é usado para selecionar o intervalo de tempo entre cada incremento do cronômetro (250 ms ou 1 s).

O programa então entra em um loop infinito onde chama a subrotina `ligar_relogio` para ligar o cronômetro.

### Subrotina `ligar_relogio`

Esta subrotina verifica se o switch 0 está acionado. Se estiver, ela ativa o decodificador dos displays de 7 segmentos e insere o equivalente ao número 0 no acumulador. Ela então move esse número para a porta 1 (P1.0 a P1.7) para exibir no display de sete segmentos.

A subrotina então chama a subrotina `delay_switch` para criar um delay antes de incrementar o valor do cronômetro. Ela repete esse processo para os números de 1 a 9.

Se em qualquer momento durante esse processo o switch 0 for acionado, a subrotina `desligar_relogio` é chamada para desligar o cronômetro.

### Subrotina `desligar_relogio`

Esta subrotina simplesmente desativa o decodificador dos displays de 7 segmentos, efetivamente desligando o cronômetro.

### Subrotina `delay_switch`

Esta subrotina verifica se o switch 1 está acionado. Se estiver, ela pula as instruções da subrotina `delay_1s` e executa a subrotina `delay_025s`. Se não estiver, ela executa a subrotina `delay_1s`.

### Subrotinas `delay_025s` e `delay_1s`

Estas subrotinas implementam os delays de 250 ms e 1 s, respectivamente. Elas usam loops e registradores para criar os delays, ajustando os valores para considerar o tempo de execução das instruções.
A subrotina 'delay_025s' implementa um delay de 1ms e o repete 250 vezes, já a 'delay_1s' repete a subrotina 'delay_025s' quatro vezes, garantindo um delay de aproximadamente 1s (não é exato pois os custos de tempo das instruções alteram a precisão).

O programa em assembly foi escrito seguindo as seguintes especificações:

- O cronômetro deve ser inicializado com o valor zero e desligado.
- O switch 0 deve ligar ou desligar o cronômetro. Quando ligado, o cronômetro deve começar a contar a partir do valor atual. Quando desligado, o cronômetro deve parar de contar e manter o valor atual no display.
- O switch 1 deve selecionar o intervalo de tempo entre cada incremento do cronômetro: 250ms ou 1s (padrão).
- O cronômetro deve contar de forma crescente, de 0 a 9 segundos, e depois voltar a zero. O valor deve ser atualizado no display a cada incremento.

Os principais recursos e desafios deste trabalho foram:

- Utilizar subrotinas para modularizar o código e facilitar a manutenção e a depuração.
- Utilizar loops e registradores para implementar os delays de 250 ms e 1 s, ajustando os valores para considerar o tempo de execução das instruções.
- Utilizar instruções de salto condicional para verificar o estado dos switches e controlar o fluxo do programa.
- Utilizar instruções de manipulação de bits para definir ou limpar os bits dos ports e controlar os componentes do circuito.
