ENTITY apostila6pag13 IS -- som_7a 
	GENERIC(n : INTEGER := 4); -- no. de bits 
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); -- inputs somador
            ze: IN BIT;   -- vem um
		    s : OUT BIT_VECTOR(n-1 DOWNTO 0); -- soma
		    zs: OUT BIT);  -- vai um 
END apostila6pag13;

ARCHITECTURE testeapostila6pag13 OF apostila6pag13 IS
COMPONENT apostila6pag5
	PORT (a, b, ve: IN BIT; s, vs: OUT BIT);
END COMPONENT;
SIGNAL v: BIT_VECTOR(n-1 DOWNTO 1); -- vai um interno 
BEGIN 
	global: FOR i IN 0 TO n-1 GENERATE
		def: IF i = 0 GENERATE
			primeira: apostila6pag5 PORT MAP(x(i), y(i), ze, s(i), v(i+1));-- 1a cel
		END GENERATE def;
		abc: IF (i > 0) AND (i < n-1) GENERATE
			centro: apostila6pag5 PORT MAP(x(i), y(i), v(i), s(i), v(i+1));-- centro
		END GENERATE abc;
		ghi: IF i=n-1 GENERATE
			ultima: apostila6pag5 PORT MAP(x(i), y(i), v(i), s(i), zs);-- ultima
		END GENERATE ghi;	
	END GENERATE global;
END testeapostila6pag13;

