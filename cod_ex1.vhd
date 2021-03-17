ENTITY cod_ex1 IS
	PORT (sa : IN BIT;
			sb,sc : BUFFER BIT);
END cod_ex1;

ARCHITECTURE teste_cod_ex1 OF cod_ex1 IS
BEGIN 
	sc <= sb;
	sb <= sa;
END teste_cod_ex1;