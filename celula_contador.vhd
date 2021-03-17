ENTITY celula_contadorRev1 IS -- Contador de módulo 9 crescente
    PORT (	ck: IN BIT;
			rst: IN BIT; -- rst='1' q="0000"
			enb_0: IN BIT; -- habilita contagem se rst = '0'
			cnl_9: OUT BIT; -- informa à cel. seguinte para incrementar 
			q: OUT INTEGER RANGE 0 TO 9); -- saida inteiro 
END celula_contadorRev1;

ARCHITECTURE testecelula_contadorRev1 OF celula_contadorRev1 IS 
BEGIN 
	abc:PROCESS (ck, enb_0) -- sensivel a ck ou rst
	VARIABLE qv : INTEGER RANGE 0 TO 9; 
	BEGIN
		IF ((qv = 9)AND (enb_0='1')) THEN cnl_9 <= '1'; -- habilita a contagem na prox. celula
		ELSE cnl_9 <= '0'; 
		END IF;
		IF (ck'EVENT AND ck = '1') THEN -- define ck como borda de subida
			IF rst = '0' THEN qv := 0; -- q="0000" independe de ck
			ELSIF (rst = '1' AND enb_0 = '1') THEN
				IF qv = 9  THEN qv := 0; -- retorna a zero
				ELSIF qv < 9 THEN qv := qv +1; -- incrementa
				END IF;
			END IF;
		END IF; 
		q <= qv;
	END PROCESS abc;
END testecelula_contadorRev1;

