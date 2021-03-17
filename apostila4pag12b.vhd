ENTITY apostila4pag12b IS -- apost4pag12b - null_3b
	PORT ( 	w: IN BIT_VECTOR(2 DOWNTO 0); -- entradas z
			sel: IN BIT_VECTOR(1 DOWNTO 0); -- entrada sel
			s: OUT BIT); -- selecao
END apostila4pag12b;

ARCHITECTURE testeapostila4pag12b OF apostila4pag12b IS
BEGIN 
	abc: PROCESS(w, sel) -- sinal "sel" inserido na lista
	BEGIN
		s <= w(2) NOR w(0);
		IF sel = "00" THEN s <= w(0) AND w(1);
		ELSIF sel =  "10" THEN s <= w(2) XOR w(0);
		ELSE NULL;
		END IF;
	END PROCESS abc;
END testeapostila4pag12b;
