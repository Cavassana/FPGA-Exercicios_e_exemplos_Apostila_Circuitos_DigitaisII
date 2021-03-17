ENTITY apostila6pag19 IS -- loop_wl
	GENERIC (n : INTEGER :=4);
	PORT (e_bit: IN BIT_VECTOR(n-1 DOWNTO 0); -- input vetor de bits
		  inteiro_while: OUT INTEGER RANGE 0 TO 2**n-1;  -- saida convertida para inteiro 
END apostila6pag19;

ARCHITECTURE testeapostila6pag19 OF apostila6pag19 IS
BEGIN 
	abc_while: PROCESS(e_bit)
	VARIABLE temp, i: INTEGER;
	BEGIN
		temp := 0;
		i := 0;
		WHILE (i/= e_bit'LENGTH) LOOP -- numero de iteracoes: tam do vetor de entrada
			IF e_bit(i) = '1' THEN temp:= temp+2**i;
			END IF;
			i := i+1;
		END LOOP;
		inteiro_while <= temp;
	END PROCESS abc_while;
END testeapostila6pag19;