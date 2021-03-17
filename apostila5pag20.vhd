ENTITY apostila5pag20 IS -- cnt_dec2 Contador
    PORT (	ck: IN BIT; -- relogio
			ld: IN BIT; -- load data sincrono
			rst: IN BIT; -- rst='1' => q="0000" assinc.
			d : IN INTEGER RANGE 15 DOWNTO 0; -- entrada d 
			q : OUT INTEGER RANGE 15 DOWNTO 0); -- saida q
END apostila5pag20;

ARCHITECTURE testeapostila5pag20 OF apostila5pag20 IS 

BEGIN 
	abc:PROCESS (ck, rst) -- estado inicial
	VARIABLE qv : INTEGER RANGE 15 DOWNTO 0; 
	BEGIN
	IF rst = '1' THEN qv := 0; -- q="0000" independe de ck
	ELSIF (ck'EVENT AND ck = '1') THEN -- define ck como borda de subida
		IF (ld = '1') THEN qv := d; -- carrega dados
		ELSE 
			IF qv >= 9 THEN qv := 0; -- retorna a zero
			ELSE qv := qv +1; -- incrementa
			END IF;
		END IF;
	END IF; 
	q <= qv;
	END PROCESS abc;
END testeapostila5pag20;