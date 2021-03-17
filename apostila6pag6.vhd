ENTITY apostila6pag6 IS -- som_2a de 3 bits
	GENERIC (n : INTEGER := 3); -- def valor
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); -- entradas do somador
          cin: IN BIT;   -- entrada vem um
		  soma : OUT BIT_VECTOR(n-1 DOWNTO 0); -- soma
		  cout: OUT BIT);  -- vai um (overflow)
END apostila6pag6;

ARCHITECTURE testeapostila6pag6 OF apostila6pag6 IS
COMPONENT apostila6pag5
	PORT (a, b, ve: IN BIT; s, vs: OUT BIT);
END COMPONENT;
SIGNAL v: BIT_VECTOR(3 DOWNTO 1); -- vai um interno (overflow)
BEGIN 
	x0: apostila6pag5 PORT MAP(   x(0),    y(0),     cin,    soma(0),     v(1));
	x1: apostila6pag5 PORT MAP(   x(1),    y(1),    v(1),     soma(1),     v(2));  
	x2: apostila6pag5 PORT MAP(	  x(2),	   y(2),    v(2),     soma(2),     v(3));  
	x3: apostila6pag5 PORT MAP(   x(3),    y(3),    v(3),     soma(3),       cout);  
END testeapostila6pag6;

