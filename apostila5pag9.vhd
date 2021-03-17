ENTITY apostila5pag9 IS -- flip3_2 Reg_3Bits_INIT_SINCRONA
    PORT (	ck: IN BIT; -- relogio
			rst: IN BIT; -- rst=1 leva q-000 sincrono
			set: IN BIT; -- set=1 leva q-111 sincrono
			d : IN BIT_VECTOR(2 DOWNTO 0); -- d[2]d[1]d[0]
			q : OUT BIT_VECTOR(2 DOWNTO 0)); -- q[2]q[1]q[0]
END apostila5pag9;

ARCHITECTURE testeapostila5pag9 OF apostila5pag9 IS 
BEGIN 
	PROCESS (ck)
	BEGIN
		IF (ck'EVENT AND ck = '1') THEN -- borda de subida
			IF (rst = '1') THEN q <= "000"; -- q=000
			ELSIF (set = '1') THEN q <= "111"; -- q=111
			ELSE q <= d; -- latch transparente
			END IF; 
		END IF;
	END PROCESS;
END testeapostila5pag9;