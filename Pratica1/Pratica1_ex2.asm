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