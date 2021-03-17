ENTITY apostila6pratlab1 IS -- comparador
	GENERIC(n : INTEGER := 3); -- no. de bits 
	PORT (ai, bi, e_ma, e_me: BIT_VECTOR(n-1 DOWNTO 0); -- input
		  s_ma, s_me: OUT BIT_VECTOR(n-1 DOWNTO 0)); -- output
END apostila6pratlab1;

ARCHITECTURE testeapostila6pratlab1 OF apostila6pratlab1 IS
COMPONENT celula_comparador
	PORT (ai, bi, e_ma, e_me: IN BIT; s_ma, s_me: OUT BIT);
END COMPONENT;
BEGIN 
	PROCESS(ai, bi, e_ma, e_me)
	VARIABLE sa: BIT_VECTOR(n-1 DOWNTO 1); -- interligacao s_ma->e_ma 
	VARIABLE se: BIT_VECTOR(n-1 DOWNTO 1); -- interligacao s_me->e_me
		for_lp: FOR i IN n-1 DOWNTO 0 LOOP
			def: IF i = n-1 GENERATE
				primeira: celula_comparador PORT MAP(ai(i), bi(i),'0','0', sa(i), se(i));-- 1a cel
			END GENERATE def;
			ghi: IF (i > 0) AND (i < n-1) GENERATE
				centro: celula_comparador PORT MAP(ai(i), bi(i), sa(i),  se(i), sa(i-1), se(i-1));-- centro
			END GENERATE ghi;
			klm: IF i=0 GENERATE
				ultima: celula_comparador PORT MAP(ai(i), bi(i),sa(i+1), se(i+1),s_ma, s_me);-- ultima
			END GENERATE klm;	
		END LOOP for_lp;
	END PROCESS;
END testeapostila6pratlab1;