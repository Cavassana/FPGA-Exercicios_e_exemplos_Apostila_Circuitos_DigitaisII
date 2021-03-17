ENTITY apostila5PraLab1 IS -- REG8x4
    PORT (	ck: IN BIT;
			sel: IN BIT; -- sel='1' q<=da else q<=db
			da: IN BIT_VECTOR(3 DOWNTO 0); -- da[3]da[2]da[1]da[0]
			db: IN BIT_VECTOR(3 DOWNTO 0); -- db[3]db[2]db[1]db[0]
			q: OUT BIT_VECTOR(3 DOWNTO 0)); -- q[3]q[2]q[1]q[0]
END apostila5PraLab1;

ARCHITECTURE testeapostila5PraLab1 OF apostila5PraLab1 IS 
	SIGNAL qv : BIT_VECTOR(3 DOWNTO 0); 
BEGIN 
	abc:PROCESS (ck) -- sensivel apenas a ck
	BEGIN
	IF (ck'EVENT AND ck = '0') THEN -- define ck como borda de descida
		IF sel='1' THEN qv <= da;
		ELSE qv= db;
		END IF;
	END IF; 
	q <= qv;
	END PROCESS abc;
END testeapostila5PraLab1;