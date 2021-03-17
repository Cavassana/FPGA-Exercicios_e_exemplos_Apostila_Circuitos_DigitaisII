ENTITY apostila4pag3 IS -- apost4pag.3 - sens_tes 
	PORT (a, b: IN BIT; -- a, b input binario
		  sa, sb: OUT BIT); -- sa, sb output binario
END apostila4pag3;

ARCHITECTURE testeapostila4pag3 OF apostila4pag3 IS
BEGIN 
	abc: PROCESS(a) IS -- executado na alteracao do valor "a". 
	BEGIN 
		sa<=a;	-- "sa" sempre recebe "a"
		sb<=b;	-- "sb" recebera "b" somente quando "a" sofrer uma mudanca
	END PROCESS abc;
END testeapostila4pag3;
