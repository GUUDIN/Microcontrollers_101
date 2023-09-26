	org 	00h; Origem em 00h

beginning:	; Inicializar o programa com uma label

	MOV		A,#02h; Mover de forma imediata o valor 2 em decimal para o ACC.
	MOV 	B,#03h; Mover de forma imediata o valor 3 em decimal para B
	MOV 	R0,#07h; Mover para um endereço de memória qualquer o valor imediato 7 em decimal
	ADD		A, R0; Somar o conteúdo do endereço de memória escolhido na linha anterior com ACC.
	DEC		A; Decrementar 3 unidades de ACC
	DEC		A
	DEC		A
	INC 	B; Incrementar 1 unidade em B
	SUBB 	A,B; Subtrair A por B
	MUL 	AB; Multiplicar A por B
	INC 	B; Incrementar 2 unidades em B
	INC 	B
	DIV 	AB; Dividir A por B
	MOV 	R0, A; Armazenar os conteúdos de A e B em dois endereços de memória quaisquer na RAM.
	MOV 	R1, B
	JMP 	beginning; Saltar para label declarada no “inicio”
	end		; Encerrar o programa.

;Resposta à questão: O bit menos significativo do PSW representa a paridade do número de bits no acumulador, no caso do número 4 temos 0100b, por isso o psw apresenta o número 1 (quantidade ímpar de números 1). De maneira similar, o número 3 (0011b) possui uma quantidade par de números 1 e por isso o PSW apresenta um 0 no seu bit menos significativo. 

