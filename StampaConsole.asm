PrintChar equ &BB5A	;Indirizzo di memoria delle direttive TXT OUTPUT e 
WaitChar equ &BB06	;KM WAIT CHAR del firmware CPC

org &8000		;Origine del programma nell'indirizzo &8000
	call WaitChar	;Si richiamano i due metodi
	call PrintChar
	push AF		;Si inserisce il carattere preso in input nella stack
		ld A, '|' ;Si carica nel registro A il carattere '|'
		push AF   ;Si inserisce il carattere nella stack
		call PrintChar ;Si stampa il carattere
			ld A, 'x'   ;Si inserisce in A il carattere 'x'
			call PrintChar ;Si stampa il carattere appena inserito
		pop AF    ;Si rimuove dalla stack il carattere '|'
		call PrintChar ;Si stampa nuovamente '|'
	pop AF		;Si rimuove un carattere dalla stack,
	call PrintChar  ;in questo caso il carattere inserito dall'utente
ret			;e si stampa richiamando il metodo PrintChar






