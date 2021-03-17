LIBRARY bibli_1; -- permite a referencia a biblioteca bibli_1
ENTITY lb_uso IS
PORT (a, b, c : IN BIT;
	s_e, s_ou : OUT BIT);
END lb_uso;
ARCHITECTURE teste OF lb_uso IS
COMPONENT lb_and3 -- resultado da compilacao se encontra em bibli_1
	PORT (i0, i1, i2 : IN BIT; s : OUT BIT);
END COMPONENT;
COMPONENT lb_or3 -- resultado da compilacao se encontra em bibli_1
	PORT (i0, i1, i2 : IN BIT; s : OUT BIT);
END COMPONENT;
BEGIN
	x1: lb_and3 PORT MAP(a, b, c, s_e);
	x2: lb_or3 PORT MAP(a, b, c, s_ou);
END teste;