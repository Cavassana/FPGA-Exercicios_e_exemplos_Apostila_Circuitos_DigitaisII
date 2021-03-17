ENTITY apostila6pag15 IS -- 
	GENERIC(n : INTEGER := 4); -- no. de bits 
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); -- inputs somador
            ze: IN BIT;   -- vem um
		    s : OUT BIT_VECTOR(n-1 DOWNTO 0); -- soma
		    zs: OUT BIT);  -- vai um 
END apostila6pag15;

ARCHITECTURE testeapostila6pag15 OF apostila6pag15 IS
BEGIN 
	cde: PROCESS( x, y, ze)
	VARIABLE v: BIT_VECTOR (n DOWNTO 0); -- vai um 
	BEGIN
		v(0) := ze;
		abc: FOR i IN 0 TO n-1 LOOP
			s(i) <= x(i) XOR y(i) XOR v(i); -- soma
			v(i+1):=  ((x(i) AND y(i)) 
					OR (x(i) AND v(i)) 
					OR (y(i) AND v(i))); 
		END LOOP abc;
		zs <= v(n);
	END PROCESS cde;
END testeapostila6pag15;

