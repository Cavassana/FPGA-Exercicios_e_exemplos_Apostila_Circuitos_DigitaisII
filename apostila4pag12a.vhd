ENTITY apostila4pag12a IS -- apost4pag12a - null_3a
	PORT ( 	z: IN BIT_VECTOR(2 DOWNTO 0); -- entradas z
			sel: IN BIT_VECTOR(1 DOWNTO 0); -- entrada sel
			s: OUT BIT); -- selecao
END apostila4pag12a;

ARCHITECTURE testeapostila4pag12a OF apostila4pag12a IS
BEGIN 
	abc: PROCESS(z, sel) -- sinal "sel" inserido na lista
	BEGIN
		s <= z(2) NOR z(0);
		CASE sel IS
			WHEN "00" => s <= z(0) AND z(1);
			WHEN "10" => s <= z(2) XOR z(0);
			WHEN OTHERS => NULL;
		END CASE;
	END PROCESS abc;
END apostila4pag12a;
