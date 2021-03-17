ENTITY Atv3Ex3 IS 
	PORT (p0 , p1, p2, p3 : IN BIT; 
			x0 , x1, int : OUT BIT);
END Atv3Ex3;

ARCHITECTURE testeDeAtv3Ex3 OF Atv3Ex3 IS 
    SIGNAL selecao : BIT_VECTOR (3 DOWNTO 0);
BEGIN 
selecao<= p0 & p1 & p2 & p3;
	WITH selecao SELECT 
		x1<= '1' WHEN "0010",  
           '1' WHEN "0011", 
           '1' WHEN "0001",
           '1' WHEN "0000",
           '0' WHEN OTHERS;
	WITH selecao SELECT   			
		x0<= '1' WHEN "0100", 
			  '1' WHEN "0101",  
           '1' WHEN "0110", 
           '1' WHEN "0111",
           '1' WHEN "0001",
           '1' WHEN "0000", 
           '0' WHEN OTHERS;
	WITH selecao SELECT 			
		int<='0' WHEN "0000",
           '1' WHEN OTHERS; 			
END testeDeAtv3Ex3;