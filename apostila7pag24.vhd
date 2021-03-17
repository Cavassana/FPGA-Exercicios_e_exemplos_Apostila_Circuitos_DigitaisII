ENTITY apostila7pag24 IS -- sb_fct6
PORT (	ck 			 : IN BIT;
		cnt_process	 : OUT INTEGER RANGE 0 TO 15;
		cnt_function : OUT INTEGER RANGE 0 TO 15);
END apostila7pag24;

ARCHITECTURE exemplo OF apostila7pag24 IS

FUNCTION conta_f (SIGNAL ck : IN BIT) RETURN INTEGER IS
	VARIABLE af : INTEGER RANGE 0 TO 15;
BEGIN
	IF (ck'EVENT) AND (ck = '1') THEN 
		af := af +1;
	END IF;
	RETURN af;
END conta_f;

BEGIN
	abc: PROCESS (ck)
		VARIABLE a : INTEGER RANGE 0 TO 15;
	BEGIN
		IF (ck'EVENT) AND (ck = '1') THEN 
			a := a +1;
		END IF;
		cnt_process <= a;
	END PROCESS;
	cnt_function <= conta_f(ck);
END exemplo;