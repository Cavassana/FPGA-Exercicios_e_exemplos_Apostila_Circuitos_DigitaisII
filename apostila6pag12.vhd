ENTITY apostila6pag12 IS -- som_6aa 
	GENERIC(n : INTEGER := 8); -- no. de bits 
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); -- inputs somador
            ze: IN BIT;   -- vem um
		    s : OUT BIT_VECTOR(n-1 DOWNTO 0); -- soma
		    zs: OUT BIT);  -- vai um 
END apostila6pag12;

ARCHITECTURE testeapostila6pag12 OF apostila6pag12 IS
COMPONENT apostila6pag5
	PORT (a, b, ve: IN BIT; s, vs: OUT BIT);
END COMPONENT;

SIGNAL v: BIT_VECTOR(n DOWNTO 0); -- vai um interno 
BEGIN 
	v(0) <= ze;
	zs <= v(n);
	abc: FOR i IN 0 TO n-1 GENERATE
		centro: apostila6pag5 PORT MAP(x(i), y(i), v(i), s(i), v(i+1));
	END GENERATE abc;
END testeapostila6pag12;

