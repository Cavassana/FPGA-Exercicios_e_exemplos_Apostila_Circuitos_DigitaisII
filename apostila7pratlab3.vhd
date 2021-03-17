-- 3- No código a seguir é apresentada a proposta de uma função
--    para detectar o menor de dois valores. A descrição contém erros. 
--    Determine os erros e apresente o código correto.

ENTITY apostila7pratlab3 IS -- som_fct7
	PORT (a_i, b_i  : IN INTEGER RANGE 0 TO 15;
		  s_o 		: OUT INTEGER RANGE 0 TO 15);
END apostila7pratlab3;

ARCHITECTURE testeapostila7pratlab3 OF apostila7pratlab3 IS
FUNCTION minimo (a : INTEGER; b : INTEGER) RETURN INTEGER IS
	SIGNAL min : INTEGER RANGE 0 TO 15;
BEGIN
	IF (a < b) THEN 
		min <= a;
	ELSE
		min <= b;
	END IF;
	RETURN min;
END minimo;
BEGIN
	s_o <= minimo(a_i, b_i);
END testeapostila7pratlab3;