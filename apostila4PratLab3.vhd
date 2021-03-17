ENTITY apostila4PratLab3 IS -- c04_e01
    PORT (x0,x1,x2: BUFFER BOOLEAN); -- todos inputs tipo boolean
END apostila4PratLab3;

ARCHITECTURE testeapostila4PratLab3 OF apostila4PratLab3 IS 
BEGIN 
	x0 <= NOT x0 AFTER 100 ns;
	x1 <= NOT x1 AFTER 100 ns WHEN x0 ELSE x1 AFTER 100 ns;
	x2 <= NOT x2 AFTER 200 ns WHEN x1 ELSE x2 AFTER 200 ns;
END testeapostila4PratLab3;