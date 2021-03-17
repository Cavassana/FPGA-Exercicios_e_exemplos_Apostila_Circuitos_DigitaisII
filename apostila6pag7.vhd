ENTITY apostila6pag7 IS     -- som_2c -- VHDL-1993 
	PORT (x, y: IN BIT_VECTOR(3 DOWNTO 0); -- entradas do somador
          ze: IN BIT;   -- entrada vem um
		  s : OUT BIT_VECTOR(3 DOWNTO 0); -- soma
		  zs: OUT BIT);  -- vai um
END apostila6pag7;

ARCHITECTURE testeapostila6pag7 OF apostila6pag7 IS

SIGNAL v: BIT_VECTOR(3 DOWNTO 0); -- vai um interno
BEGIN 
	x0: ENTITY WORK.apostila6pag5 PORT MAP(   x(0),    y(0),      ze,     s(0),     v(1));
	x1: ENTITY WORK.apostila6pag5 PORT MAP(   x(1),    y(1),    v(1),     s(1),     v(2));  
	x2: ENTITY WORK.apostila6pag5 PORT MAP(b=>y(2), a=>x(2), ve=>v(2), s=>s(2), vs=>v(3));  
	x3: ENTITY WORK.apostila6pag5 PORT MAP(   x(3),    y(3),    v(3),     s(3),       zs);  
END testeapostila6pag7;

