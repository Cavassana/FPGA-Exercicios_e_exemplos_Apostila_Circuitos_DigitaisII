ENTITY apostila6pag22 IS -- loop_wl
	GENERIC (n : INTEGER :=4);
	PORT (e_bit: IN BIT_VECTOR(n-1 DOWNTO 0); -- input vetor de bits
		  inteiro_exit: OUT INTEGER RANGE 0 TO 2**n-1);  -- saida conv. p int 
END apostila6pag22;

ARCHITECTURE testeapostila6pag22 OF apostila6pag22 IS
BEGIN 
	abc_exit: PROCESS(e_bit)
	VARIABLE temp, i: INTEGER;
	BEGIN
		temp := 0;
		i := 0;
		LOOP -- LOOP infinito
			IF e_bit(i) = '1' THEN temp:= temp+2**i;
			END IF;
			i := i+1;
			EXIT WHEN i = e_bit'LENGTH;
		END LOOP;
		inteiro_exit <= temp;
	END PROCESS abc_exit;
END testeapostila6pag22;
