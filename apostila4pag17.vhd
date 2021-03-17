ENTITY apostila4pag17 IS -- apost4pag17 - c04_atr2
	PORT ( 	a: BUFFER BIT; -- entradas a
			b, c: OUT BIT); -- saidas b e c
END apostila4pag17;

ARCHITECTURE testeapostila4pag17 OF apostila4pag17 IS
BEGIN 
	a <= '0', '1' AFTER 100 ns, '0' AFTER 300 ns, '1' AFTER 500 ns, '0' AFTER 550 ns;
	b <= a AFTER 100 ns;
	c <= TRANSPORT a AFTER 100 ns;
END testeapostila4pag17;
