ENTITY apostila4pag7 IS -- apost4pag7 - mux_4a
	PORT ( 	i0, i1, i2, i3: IN BIT; -- entradas 
			s0, s1: IN BIT; -- selecao
			ot: OUT BIT); -- saida 
END apostila4pag7;

ARCHITECTURE testeapostila4pag7 OF apostila4pag7 IS
	SIGNAL sel : BIT_VECTOR(1 DOWNTO 0); -- declara vetor que recebera os bits de selecao
BEGIN 
	sel <= s1 & s0; -- atribui "s1" para "sel[1]" e "s0" para "sel[0]"
	abc: PROCESS(i0, i1, i2, i3, sel) -- sinal "sel" inserido na lista
	BEGIN
		IF sel = "00" THEN ot <= i0; -- atribui "i0" na saida "ot"
		ELSIF sel = "01" THEN ot <= i1; -- atribui "i1" na saida "ot"
		ELSIF sel = "10" THEN ot <= i2; -- atribui "i2" na saida "ot"
		ELSE ot<= i3;
		END IF;
	END PROCESS abc;
END testeapostila4pag7;
