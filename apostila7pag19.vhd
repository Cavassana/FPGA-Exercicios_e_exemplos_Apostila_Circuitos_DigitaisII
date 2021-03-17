ENTITY apostila7pag19 IS -- sb_over1
PORT (ai, bi, ci 	: IN INTEGER RANGE 0 TO 15;
		ar, br 		: IN REAL RANGE 0.0 TO 15.0;  -- primeia vez com reais
		si, ti 		: OUT INTEGER RANGE 0 TO 31;
		sr 			: OUT REAL RANGE 0.0 TO 31.0);
END apostila7pag19;

ARCHITECTURE teste OF apostila7pag19 IS

FUNCTION soma (a, b : INTEGER) RETURN INTEGER IS	-- 1a funcao
	BEGIN
	RETURN a + b;
END soma;

FUNCTION soma (a, b, c : INTEGER) RETURN INTEGER IS -- 2a funcao
	BEGIN
	RETURN a + b + c;
END soma;

FUNCTION soma (x, y : REAL) RETURN REAL IS 			-- 3a funcao
	BEGIN
	RETURN x + y + 1.0;
END soma;

BEGIN
	si <= soma(ai,bi);	  -- ai,bi operandos tipo integer 	 -> 1a funcao
	ti <= soma(ai,bi,ci); -- ai,bi,ci operandos tipo integer -> 2a funcao
	sr <= soma(ar,br); 	  -- ar,br operandos tipo real 		 -> 3a funcao
END teste;
