ENTITY apostila5pag6 IS -- latch3_1 
    PORT (	en: IN BIT; -- habilita 
			rst: IN BIT; -- rst=1 leva q-000
			set: IN BIT; -- SET=1 leva q-111
			d : IN BIT_VECTOR(2 DOWNTO 0); -- d[2]d[1]d[0]
			q : OUT BIT_VECTOR(2 DOWNTO 0)); -- q[2]q[1]q[0]
END apostila5pag6;

ARCHITECTURE testeapostila5pag6 OF apostila5pag6 IS 
BEGIN 
	reg_latch: PROCESS (en, d, rst, set)
	BEGIN
		IF (rst = '1') THEN q <= "000"; -- q=000 independente de en
		ELSIF (set = '1') THEN q <= "111"; -- q=111 independente de en
		ELSIF (en = '1') THEN q <= d; -- condicao do sinal para habilitar
		END IF;
	END PROCESS reg_latch;
END testeapostila5pag6;