ENTITY apostila6pag18 IS -- loop_fl
	PORT (e_bit: IN BIT_VECTOR(n-1 DOWNTO 0); -- input vetor de bits
		  inteiro_for: OUT INTEGER RANGE 0 TO 15);  -- saida convertida para inteiro 
END apostila6pag18;

ARCHITECTURE testeapostila6pag18 OF apostila6pag18 IS
BEGIN 
	abc: PROCESS(e_bit)
	VARIABLE temp: INTEGER;
	BEGIN
		temp := 0;
		FOR i IN e_bit'RANGE LOOP -- numero de iteracoes: tam do vetor de entrada
			IF e_bit(i) = '1' THEN temp:= temp+2**i;
			END IF;
		END LOOP;
		inteiro_for <= temp;
	END PROCESS abc;
END testeapostila6pag18;