ENTITY apostila5PratLab2 IS -- Contador de 4-bits crescente ou decrescente
    PORT (	ck: IN BIT;
			rst: IN BIT; -- rst='1' q="0000"
			ld: IN BIT; -- load data sincrono
			crs: IN BIT; -- estabelece o sentido
			d: IN INTEGER RANGE 0 TO 11; -- d[3]d[2]d[1]d[0]
			q: OUT INTEGER RANGE 0 TO 11); -- q[3]q[2]q[1]q[0]
END apostila5PratLab2;

ARCHITECTURE testeapostila5PratLab2 OF apostila5PratLab2 IS 
BEGIN 
	abc:PROCESS (ck, rst) -- sensivel a ck ou rst
	VARIABLE qv : INTEGER RANGE 0 TO 11; 
	BEGIN
	IF rst = '1' THEN qv := 0; -- q="0000" independe de ck
	ELSIF (ck'EVENT AND ck = '1') THEN -- define ck como borda de subida
		IF (ld = '1') THEN qv := d; -- carrega dados
		ELSE
			IF crs = '1' THEN
				IF qv >= 11 THEN qv := 0; -- retorna a zero
				ELSE qv := qv +1; -- incrementa
				END IF;
			ELSE 
				IF qv <= 0 THEN qv := 11; -- retorna ao onze
				ELSE qv := qv -1; -- decrementa
				END IF;
			END IF;
		END IF;
	END IF; 
	q <= qv;
	END PROCESS abc;
END testeapostila5PratLab2;
