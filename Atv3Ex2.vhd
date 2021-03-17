ENTITY Atv3Ex2 IS 
	PORT (p0 , p1, p2, p3 : IN BIT; 
			x0 , x1, int : OUT BIT);
END Atv3Ex2;

ARCHITECTURE testeDeAtv3Ex2 OF Atv3Ex2 IS 
BEGIN 
	x1<= '0' WHEN p0 = '1' ELSE
		  '0' WHEN p0 = '0' AND p1 = '1' ELSE	
		  '1';  
	x0<= '0' WHEN p0 = '1' ELSE
		  '0' WHEN p0 = '0' AND p1 = '0' AND p2 = '1' ELSE
		  '1'; 
	int<= '0' WHEN p0 = '0' AND p1 = '0'AND p2 = '0' AND p3 = '0' ELSE
			'1';
END testeDeAtv3Ex2;