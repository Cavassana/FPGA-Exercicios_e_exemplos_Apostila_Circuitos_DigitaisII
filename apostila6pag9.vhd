ENTITY apostila6pag9 IS -- flipn_3
	GENERIC (n : INTEGER := 3); -- def valor
	PORT (ck   : IN BIT;
          rst  : IN BIT; -- reseta em ALTO
		  d	   : IN BIT_VECTOR(n-1 DOWNTO 0);
		  q    : OUT BIT_VECTOR(n-1 DOWNTO 0));
END apostila6pag9;

ARCHITECTURE testeapostila6pag9 OF apostila6pag9 IS
BEGIN 
	PROCESS (ck,rst)
	BEGIN                      
		IF (rst='1') THEN q<= (OTHERS => '0'); -- reseta indie de ck
		ELSIF (ck'EVENT AND ck='1') THEN q <= d; -- armazena dado 
		END IF;
	END PROCESS;
END testeapostila6pag9;

