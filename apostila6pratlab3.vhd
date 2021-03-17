ENTITY apostila6pratlab3 IS -- 3 contadores de módulo 9
	GENERIC(n : INTEGER := 3); -- define no. de contadores
    PORT (	ck: IN BIT;
			rst: IN BIT; -- rst='1' q="0000"
			enb_0: IN BIT; -- habilita contagem se rst = '0'
			enb_3: OUT BIT; -- informa à cel. seguinte para incrementar 
			q0: OUT INTEGER RANGE 0 TO 9;
			q1: OUT INTEGER RANGE 0 TO 9;
			q2: OUT INTEGER RANGE 0 TO 9); -- saida inteiro para 3 contadores de modulo 9
END apostila6pratlab3;

ARCHITECTURE testeapostila6pratlab3 OF apostila6pratlab3 IS 
COMPONENT celula_contador
	PORT (ck, rst, enb_0: IN BIT; cnl_9: OUT BIT; q: OUT INTEGER RANGE 0 TO 9);
END COMPONENT;
SIGNAL enable: BIT_VECTOR( 1 TO n-1); -- interligacao cnl_9->enb_0 
BEGIN 
	for_lp: FOR i IN 0 TO n-1 GENERATE
		def: IF i = 0 GENERATE
			primeira: celula_contador PORT MAP(ck, rst, enb_0, enable(i+1), q0);-- 1a cel
		END GENERATE def;
		ghi: IF (i > 0) AND (i < n-1) GENERATE
			centro: celula_contador PORT MAP(ck, rst, enable(i), enable(i+1), q1);-- centro
		END GENERATE ghi;
		klm: IF i=n-1 GENERATE
			ultima: celula_contador PORT MAP(ck, rst, enable(i), enb_3, q2);-- ultima
		END GENERATE klm;	
	END GENERATE for_lp;
END testeapostila6pratlab3;