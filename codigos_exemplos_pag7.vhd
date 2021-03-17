ENTITY codigos_exemplos  IS
PORT (x1		:IN INTEGER; -- porta entrada
		y1,z1	:OUT INTEGER); -- porta saida
END;

ARCHITECTURE  teste OF codigos_exemplos  IS
	SIGNAL s1 : INTEGER; -- sinal int
	CONSTANT c1: INTEGER:= 7; -- const. tipo int
BEGIN
	y1 <= s1;
	s1 <= x1;
	z1 <= c1;
END;