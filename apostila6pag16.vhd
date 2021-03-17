ENTITY apostila6pag16 IS -- rev_bit0
	GENERIC(n : INTEGER := 4);
	PORT   (x : IN BIT_VECTOR(n-1 DOWNTO 0);
		    s, t: OUT BIT_VECTOR(n-1 DOWNTO 0));
END apostila6pag16;

ARCHITECTURE testeapostila6pag16 OF apostila6pag16 IS
BEGIN 
	PROCESS(x)
	BEGIN
		abc: FOR i IN n-1 DOWNTO 0 LOOP
			t(t'LEFT -i) <= x(i);
		END LOOP abc;
		def: FOR i IN x'RANGE LOOP -- faixa x'RANGE = n-1 DOWNTO 0
			s(s'LEFT -i) <= x(i);
		END LOOP def;
	END PROCESS;
END testeapostila6pag16;

