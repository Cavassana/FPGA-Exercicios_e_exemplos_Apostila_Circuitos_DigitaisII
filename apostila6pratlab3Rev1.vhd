ENTITY apostila6pratlab3 IS -- 3 contadores de módulo 9
	GENERIC( n : INTEGER := 3); -- define no. de contadores
    PORT (	ck: IN BIT;
			  rst: IN BIT; -- rst='1' q="0000"
			enb_0: IN BIT; -- habilita contagem se rst = '0'
			enb_3: OUT BIT; -- informa à cel. seguinte para incrementar 
			   q0: OUT INTEGER RANGE 0 TO 9; -- menos significativo 
			   q1: OUT INTEGER RANGE 0 TO 9; 
			   q2: OUT INTEGER RANGE 0 TO 9); -- mais significativo
END apostila6pratlab3;

ARCHITECTURE testeapostila6pratlab3 OF apostila6pratlab3 IS 
COMPONENT celula_contador
	PORT (ck, rst, enb_0: IN BIT; cnl_9: OUT BIT; q: OUT INTEGER RANGE 0 TO 9);
END COMPONENT;
SIGNAL enable: BIT_VECTOR( 1 TO n-1); -- interligacao cnl_9->enb_0 

BEGIN 
		unidades: celula_contador PORT MAP(ck, rst, enb_0, enable(1), q0);-- 1a cel
		dezenas: celula_contador PORT MAP(ck, rst, enable(1), enable(2), q1);-- 2a cel
		centenas: celula_contador PORT MAP(ck, rst, enable(2), enb_3, q2);-- 3a cel
END testeapostila6pratlab3;