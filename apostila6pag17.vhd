ENTITY apostila6pag17 IS -- som_9a
	GENERIC(n : INTEGER := 3); -- no. de bits 
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); -- inputs
            ze: IN BIT;   -- vem um
		    s : OUT BIT_VECTOR(n-1 DOWNTO 0); -- soma
		    zs: OUT BIT);  -- vai um 
END apostila6pag17;

ARCHITECTURE testeapostila6pag17 OF apostila6pag17 IS
BEGIN 
	abc: PROCESS( x, y, ze)
	VARIABLE i: INTEGER;
	VARIABLE v: BIT_VECTOR(n DOWNTO 0); -- vai um interno
	BEGIN
		i := 0; -- atualizado a cada iteracao
		v(0) := ze; 
		abc: WHILE i <= n-1 LOOP
			s(i) <= x(i) XOR y(i) XOR v(i); -- soma
			v(i+1):=  ((x(i) AND y(i)) 
					OR (x(i) AND v(i)) 
					OR (y(i) AND v(i))); 
			i := i+1;
		END LOOP abc;
		zs <= v(n);
	END PROCESS cde;
END testeapostila6pag17;


