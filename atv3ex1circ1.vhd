ENTITY atv3ex1circ1 IS
	PORT (a : IN BIT;
		x : OUT BIT);
END atv3ex1circ1;

ARCHITECTURE testeatv3ex1circ1 OF atv3ex1circ1 IS
	SIGNAL b : BIT;
BEGIN 
	x<= b XOR a;
	b<= NOT a;
END testeatv3ex1circ1;