ENTITY apostila7pratlab4 IS -- flipn_3
	GENERIC (n : INTEGER := 3); -- def valor
	PORT (ck   : IN BIT;
		  set  : IN BIT; -- seta em BAIXO
          clr  : IN BIT; -- limpa em BAIXO
		  d	   : IN BIT;
		  q_b  : OUT BIT;
		  q    : OUT BIT);
END apostila7pratlab4;

ARCHITECTURE testeapostila7pratlab4 OF apostila7pratlab4 IS
BEGIN 
	ff_d:PROCESS (ck,clr,set)
	BEGIN 
		IF (clr='0' AND set='0') THEN  	-- modo indefinido
			q	<= '1'; 		
			q_b <= '1';
		ELSIF (set='0') THEN 
			q	<= '1'; 		-- SET indie de ck
			q_b <= '0';
		ELSIF (clr='0') THEN 	-- LIMPA indie de ck
			q	<= '0'; 		-- SET indie de ck
			q_b <= '1';
		ELSIF  (clr='1' AND set='1') THEN
			IF (ck'EVENT AND ck='1') THEN 
				q 	<= d; -- armazena dado 
				q_b <= NOT d; -- armazena dado negado
		END IF;
	END PROCESS ff_d;
END testeapostila7pratlab4;
