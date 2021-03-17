ENTITY lb_or3 IS
PORT (i0, i1, i2 : IN BIT;
	s : OUT BIT);
END lb_or3;
ARCHITECTURE teste OF lb_or3 IS
BEGIN
	s <= i0 OR i1 OR i2;
END teste;