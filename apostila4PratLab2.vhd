ENTITY apostila4PratLab2 IS -- erro1
    PORT (a,b,c: IN BOOLEAN; -- todos inputs tipo boolean
	x, y, z, k: OUT BIT);
END apostila4PratLab2;

ARCHITECTURE testeapostila4PratLab2 OF apostila4PratLab2 IS 
BEGIN 
	abc: PROCESS (a, b, c)
	BEGIN
		IF a THEN x <= '1';y <= '1';z <= '0';k <= '0'; -- para deixar mais evidente a entrada no if
		END IF;
		IF c THEN z <= '1'; y <= '1';x <= '0';k <= '0'; -- idem acima
		END IF;
		IF a AND b THEN y <= '0';x <= '0';z <= '0';k <= '0'; -- input b tipo boolean
		END IF;
		IF c AND b THEN k <= '1';y <= '1';x <= '0';z <= '0'; -- idem acima
		END IF;
	END PROCESS abc;
	
END testeapostila4PratLab2;