# Atividade prática de uso de set de instruções e manipulação de dados em
registradores e endereços de memória em microcontroladores

Este projeto abrange várias técnicas de manipulação de dados em Assembly utilizando o set de instruções do MCS-51, incluindo instruções de transferência de dados, instruções aritméticas, instruções lógicas e booleanas e instruções de desvio incondicional e condicional.

## Alunos

Pedro Borges Gudin - 12547997

Mateus Santos Messias - 12548000

Guilherme Castanon Silva Pereira - 11801140

<a name='transferencia'></a>
## 1. Manipulação de dados em registradores e endereços de memória por meio de instruções de transferência de dados

```assembly
	org 0000h		; coloca a origem no 0
main:
	mov	a, #10h		; move o valor 10 de forma imediata no registrador acumulador acc - 1us(1 ciclo)
	mov	a, #00h		; move o valor 0 para o acc de forma imediata1us - 1us(1 ciclo)
	clr	rs0		;  1us(1 ciclo)
	clr	rs1		; limpa os bits rs0 e rs1 para garantir a selecao do primeiro bloco de registradores - 1us(1 ciclo)
	mov	r0, #04h	; move o valor 4 para o r0 - 1us(1 ciclo)
	mov	b, #02h		; move o valor 2 para o registrador b - 2us(2 ciclo)
	mov	32h, p1		; move para o endereco 32h o valor de p1 - 2us(2 ciclo)
	setb	rs0		; seleciona o segundo banco de registradores - 1us(1 ciclo)
	mov	r4, 32h		; move o valor que esta no endereco 32h para o registrador r4 - 2us(2 ciclo)
	mov	10h, r4		; move para o endereco 10h o valor que esta em r4 - 2us(2 ciclo)
	mov	r1, #10h	; move o valor 10h para r1 - 1us(1 ciclo)
	mov	a, @r1		; trata o r1 como ponteiro, ou seja, o conteudo de r1 e tratado como endereco - 1us(1 ciclo)
	mov	dptr, #9a5bh	; move o valor 9a5bh para o registrador dptr - 2us(2 ciclo)
	nop 			; gasta 1 ciclo de maquina 1us
jmp	$			; gasta 2 ciclo de maquina 2us e segura o programa nesta linha
end				; termina o programa
; resposta questao (a): o tempo esta indicado no final dos comentarios de cada linha
; resposta questao (b): 21us
; resposta questao (c):	o valor e FF devido ao resistor de pull-up interno
; resposta questao (d):	FF
; resposta questao (e): pois dptr e um registrador de 16 bits. A mudanca ocorreu nos registradores dph e dpl. O maior valor e 0ffffh

```

<a name='aritmetica'></a>
## 2. Manipulação de dados em registradores e endereços de memória por meio de instruções Aritméticas

```assembly
	org 	00h	; Origem em 00h

beginning:		; Inicializa o programa com uma label
	MOV	A,#02h	; Move de forma imediata o valor 2 em decimal para o ACC.
	MOV 	B,#03h	; Move de forma imediata o valor 3 em decimal para B
	MOV 	R0,#07h	; Move para um endereco de memoria qualquer o valor imediato 7 em decimal
	ADD	A, R0	; Soma o conteudo do endereco de memoria escolhido na linha anterior com ACC.
	DEC	A	; Decrementa 3 unidades de ACC
	DEC	A
	DEC	A
	INC 	B	; Incrementa 1 unidade em B
	SUBB 	A,B	; Subtrai A por B
	MUL 	AB	; Multiplica A por B
	INC 	B	; Incrementa 2 unidades em B
	INC 	B
	DIV 	AB	; Divide A por B
	MOV 	R0, A	; Armazena os conteudos de A e B em dois enderecos de memoria quaisquer na RAM.
	MOV 	R1, B
JMP 	beginning	; Salta para label declarada no inicio
end			; Encerra o programa.

;Resposta a questao: O bit menos significativo do PSW representa a paridade do numero de bits no acumulador,
;no caso do numero 4 temos 0100b, por isso o psw apresenta o numero 1 (quantidade impar de numeros 1).
;De maneira similar, o numero 3 (0011b) possui uma quantidade par de numeros 1 e por isso o PSW apresenta um 0 no seu bit menos significativo. 

```

<a name='logica'></a>
## 3. Manipulação de dados em registradores e endereços de memória por meio de instruções lógicas e booleanas

```assembly
	org  00h	; Coloca a origem no endereço 00h

beginning: 		; Inicializa o programa com uma label
	MOV  A,#0011b	; Move (forma imediata) 0000 0011b para o ACC
	MOV  B,#1001b	; Move (forma imediata) 0000 1001b para o ACC
	ANL  A,B	; Realiza AND lógico entre A e B
	RR   A		; Rotaciona A à direita em 2 bits.
	RR   A			
	CPL  A		; Realiza o complemento de A
	RL   A		; Rotaciona A à esquerda em 2 bits.
	RL   A
	ORL  A,B	; Realiza OR lógico entre A e B
	XRL  A,B	; Realiza XOR entre A e B
	SWAP A		; Realiza SWAP de A;
JMP beginning		; Salta para a label inicial
end			; Encerra o programa.

```

<a name='desvio'></a>
## 4. Manipulação de dados em registradores e endereços de memória por meio de instruções de desvio incondicional e condicional

```assembly
	org		00h 		;Origem do programa em 00h
JMP 	main	 			;Salta para a main
	org		33h 		;Reposiciona a origem em 33h

main:

	CLR		A 		;Limpa o registrador acumulador A
	MOV		R0,#04h 	;Coloca o valor 4 em R0

	bloco1:
		CJNE A,#0,bloco3 	;Se o registrador acumulador A for diferente de 0, salta para o bloco 3
		JMP bloco2 		;Se nao for, salta para o bloco 2
		NOP
	
	bloco2:
		MOV 	A,R0 		;Move o valor de R0 para o registrador acumulador A
		JMP 	bloco1		;Salta incondicionalmente para o bloco 1
	
	bloco3:
		DEC		R0 	;Decremente R0
		CJNE 	R0,#0,bloco3	;Se R0 for diferente de 0, salta para o bloco 3
		JMP 	main 		;Se nao for, saltar para main
end
```
