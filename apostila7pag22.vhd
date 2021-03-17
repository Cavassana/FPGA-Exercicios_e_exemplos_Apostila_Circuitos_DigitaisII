ENTITY apostila7pag22 IS -- sb_over4
	PORT (a_dec, b_dec 	 : IN BIT_VECTOR(3 DOWNTO 0); 	-- bit3=+significativo bit0= -sig.
			a_cre, b_cre : IN BIT_VECTOR(0 TO 2); 		-- bit0=+significativo bit2= -sig.
			s_dec 		 : OUT BIT_VECTOR(3 DOWNTO 0);
			s_cre 		 : OUT BIT_VECTOR(0 TO 2));
END apostila7pag22;

ARCHITECTURE teste OF apostila7pag22 IS

FUNCTION "+" (x, y : BIT_VECTOR) RETURN BIT_VECTOR IS  
	VARIABLE v : BIT := '0'; 					-- +sig.   -sig.    +sig. -sig.)
	VARIABLE s : BIT_VECTOR(x'RANGE); -- x'RANGE= ( 3 DOWNTO 0 ) ou ( 0 TO 2 )
BEGIN 								  -- -sig. +sig. -sig. +sig
	FOR i IN x'REVERSE_RANGE LOOP -- (i IN 0 TO 3) ou (i IN 2 DOWNTO 0)
		s(i) := x(i) XOR y(i) XOR v;
		v := (x(i) AND y(i)) OR (v AND (x(i) OR y(i)));
	END LOOP;
	RETURN s;
END "+";
BEGIN
	s_dec <= a_dec + b_dec; -- a_dec, b_dec operandos 4 bits tipo bit-vector
	s_cre <= a_cre + b_cre; -- a_cre, b_cre operandos 3 bits tipo bit-vector
END teste;