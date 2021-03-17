-- Exemplos da Apostila 3 - exemplo 2 - pág. 
ENTITY atv3codex2revB IS
	PORT (z : IN BIT;
		  x, y : BUFFER BIT);
END atv3codex2revB;

ARCHITECTURE testeatv3codex2revB OF atv3codex2revB IS
BEGIN 
	x<= z AND y;
	y<= '1' XOR x;
END testeatv3codex2revB;