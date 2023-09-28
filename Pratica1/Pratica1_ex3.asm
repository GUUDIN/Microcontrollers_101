	org  00h	; Coloca a origem no endere�o 00h

beginning: 		; Inicializa o programa com uma label
	MOV  A,#0011b	; Move (forma imediata) 0000 0011b para o ACC
	MOV  B,#1001b	; Move (forma imediata) 0000 1001b para o ACC
	ANL  A,B	; Realiza AND l�gico entre A e B
	RR   A		; Rotaciona A � direita em 2 bits.
	RR   A			
	CPL  A		; Realiza o complemento de A
	RL   A		; Rotaciona A � esquerda em 2 bits.
	RL   A
	ORL  A,B	; Realiza OR l�gico entre A e B
	XRL  A,B	; Realiza XOR entre A e B
	SWAP A		; Realiza SWAP de A;
JMP beginning		; Salta para a label inicial
end			; Encerra o programa.