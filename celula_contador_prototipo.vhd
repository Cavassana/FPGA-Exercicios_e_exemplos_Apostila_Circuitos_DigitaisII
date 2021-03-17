ENTITY celula_contador IS -- Contador de 4-bits crescente
    PORT (	ck: IN BIT;
			rst: IN BIT; -- rst='1' q="0000"
			enb_0: IN BIT; -- habilita contagem se rst = '0'
			cnl_9: OUT BIT; -- informa à cel. seguinte para incrementar 
			q: OUT INTEGER RANGE 0 TO 9); -- saida inteiro 
END celula_contador;

ARCHITECTURE testecelula_contador OF celula_contador IS 
BEGIN 
	abc:PROCESS (ck, rst) -- sensivel a ck ou rst
	VARIABLE qv : INTEGER RANGE 0 TO 9; 
	BEGIN
	ELSIF (ck'EVENT AND ck = '1') THEN -- define ck como borda de subida
		IF rst = '1' THEN qv := 0; -- q="0000" independe de ck
		ELSIF 
			IF qv = 9  THEN
				cnl_9 <= '1';
				qv := 0; -- retorna a zero
			ELSIF qv < 9 THEN 
				cnl_9 <= '0';
				qv := qv +1; -- incrementa
			END IF;
		END IF;
	END IF; 
	q <= qv;
	END PROCESS abc;
END testecelula_contador;

