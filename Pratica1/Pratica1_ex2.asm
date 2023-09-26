org 	00h	; Origem em 00h

beginning:	; Inicializar o programa com uma label

MOV	A,#02h	; Mover de forma imediata o valor 2 em decimal para o ACC.
MOV 	B,#03h	; Mover de forma imediata o valor 3 em decimal para B
MOV 	R0,#07h	; Mover para um endereco de memoria qualquer o valor imediato 7 em decimal
ADD	A, R0	; Somar o conteudo do endereco de memoria escolhido na linha anterior com ACC.
DEC	A	; Decrementar 3 unidades de ACC
DEC	A
DEC	A
INC 	B	; Incrementar 1 unidade em B
SUBB 	A,B	; Subtrair A por B
MUL 	AB	; Multiplicar A por B
INC 	B	; Incrementar 2 unidades em B
INC 	B
DIV 	AB	; Dividir A por B
MOV 	R0, A	; Armazenar os conteudos de A e B em dois enderecos de memoria quaisquer na RAM.
MOV 	R1, B
JMP 	beginning
		; Saltar para label declarada no inicio
end		; Encerrar o programa.

;Resposta a questao: O bit menos significativo do PSW representa a paridade do numero de bits no acumulador, no caso do numero 4 temos 0100b, por isso o psw apresenta o numero 1 (quantidade impar de numeros 1). De maneira similar, o numero 3 (0011b) possui uma quantidade par de numeros 1 e por isso o PSW apresenta um 0 no seu bit menos significativo.
