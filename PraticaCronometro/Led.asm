	org 00h
	JMP beggining
	org 33h

LED EQU P1.0
Switch EQU P2.0

beggining:
	; Liga o LED
	JB		Chave, $ 	;monitora chave 0 (bit 1)
	CLR		LED 		; Acende o LED se a chave = 0 acionada (bit 0) Desliga o LED
	JNB		P2.0, $ 	; monitora chave 0 (bit 0)
	SETB	P1.0 		; Desliga o LED se chave = 1
	JMP 	main    	; loop

end


switch:
	MOV A, P2.0