ENTITY apostila7pag13 IS 	-- sb_fct9
PORT (	ck, d : IN BIT;		-- entradas
		q_fnc : OUT BIT);	-- saida
		
FUNCTION subida(SIGNAL ck: IN BIT) RETURN BOOLEAN IS
	BEGIN	
	RETURN (ck'EVENT) AND (ck='1');	
END apostila7pag13;

ARCHITECTURE teste OF apostila7pag13 IS

BEGIN
	abc: PROCESS (ck)
	BEGIN
		-- saída recebe d quando a funcao detectar borda de subida
		IF subida(ck) THEN q_fnc <= d; 
		END IF;
	END PROCESS abc;
END teste;


