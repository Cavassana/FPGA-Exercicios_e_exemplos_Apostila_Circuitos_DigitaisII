ENTITY apostila4pag18 IS -- apost4pag18 - sg_var8
	PORT ( 	sx: OUT INTEGER; -- saida teste sinal
			vx: OUT INTEGER); -- saida teste variavel
END apostila4pag18;

ARCHITECTURE testeapostila4pag18 OF apostila4pag18 IS
	SIGNAL sa : INTEGER := 1;
BEGIN 
	sig: PROCESS
	BEGIN
		sa <= sa + sa;
		sx <= sa;
		WAIT FOR 10 ns;
	END PROCESS sig;
	
	var: PROCESS
	VARIABLE va : INTEGER := 1;
	BEGIN
		va := va + va; -- := ao inves de <=
		vx <= va;
		WAIT FOR 10 ns;
	END PROCESS var;
END testeapostila4pag18;
