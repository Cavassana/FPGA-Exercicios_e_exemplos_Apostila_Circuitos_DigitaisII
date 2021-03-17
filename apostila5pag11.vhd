ENTITY apostila5pag11 IS -- flip3_3 Reg_3Bits_INIT_ASSINCRONA
    PORT (	ck: IN BIT; -- relogio
			rst: IN BIT; -- rst=1 leva q-000 sincrono
			set: IN BIT; -- set=1 leva q-111 sincrono
			d : IN BIT_VECTOR(2 DOWNTO 0); -- d[2]d[1]d[0]
			q : OUT BIT_VECTOR(2 DOWNTO 0)); -- q[2]q[1]q[0]
END apostila5pag11;

ARCHITECTURE testeapostila5pag11 OF apostila5pag11 IS 
BEGIN 
	PROCESS (ck, rst, set)
	BEGIN
		IF (rst = '1') THEN q <= "000"; -- q=000 indie de ck
		ELSIF (set = '1') THEN q <= "111"; -- q=111 indie de ck
		ELSIF (ck'EVENT AND ck = '1') THEN q <= d; -- borda de subida
		END IF; 
	END PROCESS;
END testeapostila5pag11;