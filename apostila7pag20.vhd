ENTITY apostila7pag20 IS -- sb_over2
GENERIC(n : INTEGER := 3);
	PORT (a, b : IN BIT_VECTOR(n-1 DOWNTO 0);
			 s : OUT BIT_VECTOR(n-1 DOWNTO 0));
END apostila7pag20;

ARCHITECTURE teste OF apostila7pag20 IS -- retorna tipo

FUNCTION "+" (x, y : BIT_VECTOR(n-1 DOWNTO 0)) RETURN BIT_VECTOR IS
	VARIABLE v : BIT := '0';
	VARIABLE s : BIT_VECTOR(n-1 DOWNTO 0);
BEGIN
	FOR i IN 0 TO n-1 LOOP
		s(i) := x(i) XOR y(i) XOR v;
		v := (x(i) AND y(i)) OR (v AND (x(i) OR y(i)));
	END LOOP;
	RETURN s;
END "+";

BEGIN
	s <= a + b; -- a,b operandos tipo bit-vector
END teste;