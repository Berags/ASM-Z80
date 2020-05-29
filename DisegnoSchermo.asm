ScreenSize equ &4000		;Definisce la costante ScreenSize come &4000
org &8200			;Definisce l'indirizzo di memoria del file
	ld a, %00001111		;Definisce A con il valore binario %00001111 = 15 (dec) = F (HEX)
Disegna:			;Definisce la Label Disegna, una sorta di "Sottoprogramma"
	ld hl, &C000		;Imposta il registro HL all'inizio dello schermo
	ld de, &c000+1		;Imposta il registro DE al bit successivo al registro HL
	ld bc, ScreenSize-1	;Imposta il registro BC con il valore di ScreenSize - 1
	ld (hl), a		;Carica il primo byte del registro HL in A
	ldir			;Permette di riempire tutto lo schermo
	dec a			;Decrementa il valore di A
	cp 255			;Compara il valore di A con 255, se vero imposta il flag NZ = 1
	jp nz, Disegna		;Se il flag NZ = 0 allora salta alla label Disegna
ret				;Uscita dal programma