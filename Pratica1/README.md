# Atividade prática de uso de set de instruções e manipulação de dados em
registradores e endereços de memória em microcontroladores

Este projeto abrange várias técnicas de manipulação de dados em Assembly utilizando o set de instruções do MCS-51, incluindo instruções de transferência de dados, instruções aritméticas, instruções lógicas e booleanas e instruções de desvio incondicional e condicional.

<a name='transferencia'></a>
## 1. Manipulação de dados em registradores e endereços de memória por meio de instruções de transferência de dados

```assembly
<resposta> ;(linhas de código comentadas)
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
<resposta> ;(linhas de código comentadas)
```
