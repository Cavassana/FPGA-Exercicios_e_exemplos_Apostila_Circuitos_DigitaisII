ENTITY apostila6pratlab2 IS  -- som_2a 
	PORT (x, y: IN BIT_VECTOR(3 DOWNTO 0); -- entradas do somador
          ze: IN BIT;   -- entrada vem um (overflow)
		  s : OUT BIT_VECTOR(3 DOWNTO 0); -- soma
		  zs: OUT BIT);  -- vai um (overflow)
END apostila6pratlab2;

ARCHITECTURE testeapostila6pratlab2 OF apostila6pratlab2 IS
COMPONENT apostila6pag5
	PORT (a, b, ve: IN BIT; s, vs: OUT BIT);
END COMPONENT;
SIGNAL v: BIT_VECTOR(3 DOWNTO 1); -- vai um interno (overflow)
BEGIN 
	x0: apostila6pag5 PORT MAP( x(0), y(0), ve => OPEN, s(0), v(1));
	x1: apostila6pag5 PORT MAP( x(1), y(1), v(1), s(1), v(2));  
	x2: apostila6pag5 PORT MAP( x(2), y(1), v(2), s(2), v(3));  
	x3: apostila6pag5 PORT MAP( x(3), y(3), v(3), s(3),  vs=>OPEN);  
END testeapostila6pratlab2;