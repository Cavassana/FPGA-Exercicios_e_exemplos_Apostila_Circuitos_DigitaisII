ENTITY lb_and3 IS
PORT (i0, i1, i2 : IN BIT;
	s : OUT BIT);
END lb_and3;
ARCHITECTURE teste OF lb_and3 IS
BEGIN
	s <= i0 AND i1 AND i2;
END teste;