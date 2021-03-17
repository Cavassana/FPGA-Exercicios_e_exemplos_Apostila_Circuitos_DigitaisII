ENTITY apostila4pag9 IS -- apost4pag9 - mux_5a
	PORT ( 	i0, i1, i2, i3: IN BIT; -- entradas 
			s0, s1: IN BIT; -- selecao
			ot: OUT BIT); -- saida 
END apostila4pag9;

ARCHITECTURE testeapostila4pag9 OF apostila4pag9 IS
	SIGNAL sel : BIT_VECTOR(1 DOWNTO 0); -- declara vetor que recebera os bits de selecao
BEGIN 
	sel <= s1 & s0; -- atribui "s1" para "sel[1]" e "s0" para "sel[0]"
	abc: PROCESS(i0, i1, i2, i3, sel) -- sinal "sel" inserido na lista
	BEGIN
		CASE sel IS
			WHEN "00" => ot <= i0; -- atribui "i0" na saida "ot"
			WHEN "01" => ot <= i1; -- atribui "i1" na saida "ot"
			WHEN "10" => ot <= i2; -- atribui "i2" na saida "ot"
			WHEN OTHERS => ot <= i3;
		END CASE;
	END PROCESS abc;
END testeapostila4pag9;
