ENTITY apostila4pag11 IS -- apost4pag11 - wait_a
	PORT ( 	xa, xb: BUFFER INTEGER RANGE 0 TO 15; -- entradas xa e xb
			ya, yb: BUFFER BIT); -- saida ya e yb
END apostila4pag11;

ARCHITECTURE testeapostila4pag11 OF apostila4pag11 IS
BEGIN 
	abc: PROCESS -- sinal "sel" inserido na lista
	BEGIN
		xa <= xa +1;
		ya <= '1';
		WAIT FOR 30 ns;
		ya <= '0';
		WAIT FOR 20 ns;
	END PROCESS abc;
	cde: PROCESS -- sinal "sel" inserido na lista
	BEGIN
		xb <= xb +1;
		yb <= '1';
		WAIT FOR 30 ns;
		yb <= '0';
		WAIT FOR 20 ns;
	END PROCESS cde;	
END testeapostila4pag11;
