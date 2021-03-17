ENTITY atv3circ2rev2 IS
	PORT (a : IN BIT;
		  x : BUFFER BIT);
END atv3circ2rev2;

ARCHITECTURE testeatv3circ2rev2 OF atv3circ2rev2 IS
	SIGNAL b,c : BIT;
BEGIN 
	x<= c XOR a;
	c<= b AND a;
	b<= NOT x;
END testeatv3circ2rev2;