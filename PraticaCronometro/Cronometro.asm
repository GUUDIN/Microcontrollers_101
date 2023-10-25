	org 00h

JMP beggining

	org 33h

; declarar switch 0 (porta 2.0)
SWITCH_0 EQU P2.0

; declarar switch 1 (porta 2.1)
SWITCH_1 EQU P2.1

beggining:
	CLR P3.3
	CLR P3.4
	CALL clock_ON
JMP beggining

clock_ON:
		JB SWITCH_0, clock_ON ; subrotina para ligar relogio se switch 0 acionado
		SETB P0.7
		MOV A, #0c0h
		MOV P1, A
	CALL switch_delay
		MOV A, #0f9h
		MOV P1, A
	CALL switch_delay
		MOV A, #0a4h
		MOV P1, A
	CALL switch_delay
		MOV A, #0b0h
		MOV P1, A
	CALL switch_delay
		MOV A, #099h
		MOV P1, A
	CALL switch_delay
		MOV A, #092h
		MOV P1, A
	CALL switch_delay
		MOV A, #082h
		MOV P1, A
	CALL switch_delay
		MOV A, #0f8h
		MOV P1, A
	CALL switch_delay
		MOV A, #080h
		MOV P1, A
	CALL switch_delay
		MOV A, #090h
		MOV P1, A
	CALL switch_delay
RET

switch_delay:
	JB SWITCH_1, delay_1	; pula instrucoes para delay de 1s se switch nao for acionado (bit = 1)
	CALL delay_025 ; so executa se switch foi acionado (bit = 0)
RET

delay_1: ; delay 1 segundo
    MOV R2, #1000000000
RET

delay_025: ; delay 0.25 segundo
    MOV R2, #250000000 ; 250/4 = 62.5 ~ 62
RET
	
