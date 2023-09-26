	org 	00h; Origem em 00h

beginning:	; Inicializar o programa com uma label

	MOV		A,#02h; Mover de forma imediata o valor 2 em decimal para o ACC.
	MOV 	B,#03h; Mover de forma imediata o valor 3 em decimal para B
	MOV 	R0,#07h; Mover para um endere�o de mem�ria qualquer o valor imediato 7 em decimal
	ADD		A, R0; Somar o conte�do do endere�o de mem�ria escolhido na linha anterior com ACC.
	DEC		A; Decrementar 3 unidades de ACC
	DEC		A
	DEC		A
	INC 	B; Incrementar 1 unidade em B
	SUBB 	A,B; Subtrair A por B
	MUL 	AB; Multiplicar A por B
	INC 	B; Incrementar 2 unidades em B
	INC 	B
	DIV 	AB; Dividir A por B
	MOV 	R0, A; Armazenar os conte�dos de A e B em dois endere�os de mem�ria quaisquer na RAM.
	MOV 	R1, B
	JMP 	beginning; Saltar para label declarada no �inicio�
	end		; Encerrar o programa.

;Resposta � quest�o: O bit menos significativo do PSW representa a paridade do n�mero de bits no acumulador, no caso do n�mero 4 temos 0100b, por isso o psw apresenta o n�mero 1 (quantidade �mpar de n�meros 1). De maneira similar, o n�mero 3 (0011b) possui uma quantidade par de n�meros 1 e por isso o PSW apresenta um 0 no seu bit menos significativo. 

