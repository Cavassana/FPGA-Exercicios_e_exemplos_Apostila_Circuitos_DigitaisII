ENTITY apostila7pratlab5 IS -- flipn_3
	PORT (ck  	 				: IN BIT;
		  set 				 	: IN BIT; -- seta em BAIXO
          clr  					: IN BIT; -- limpa em BAIXO
		  v,x1_x,x2_x, x3_x	: OUT BIT;
		  x4_x 					: OUT BIT;
		  q    					: OUT BIT_VECTOR(3 DOWNTO 0);
END apostila7pratlab5;

ARCHITECTURE testeapostila7pratlab5 OF apostila7pratlab5 IS
-- corpo do procedimento ff_d
PROCEDURE flipflop_d(SIGNAL ck  : IN BIT, -- ck
					SIGNAL set  : IN BIT, -- seta em BAIXO
					SIGNAL clr  : IN BIT, -- limpa em BAIXO
					SIGNAL d	: IN BIT, -- dado
					SIGNAL q    : OUT BIT,-- saida
					SIGNAL q_b  : OUT BIT) IS
BEGIN
	IF (clr='0' AND set='0') THEN  	-- modo indefinido
		q	<= '1'; 		
		q_b <= '1';
	ELSIF (set='0') THEN 
		q	<= '1'; 		-- SET indie de ck
		q_b <= '0';
	ELSIF (clr='0') THEN 	-- LIMPA indie de ck
		q	<= '0'; 		-- SET indie de ck
		q_b <= '1';
	ELSIF  (clr='1' AND set='1') THEN
		IF (ck'EVENT AND ck='1') THEN 
			q 	<= d; 		-- armazena dado 
			q_b <= NOT d; 	-- armazena dado negado
	END IF;
END flipflop_d;

SIGNAL x0, x1, x2, x3, x4 : BIT;

BEGIN
	abc: PROCESS(ck,set,clr)
	BEGIN					--     IN OUT
		x_0: flipflop_d(ck,set,clr,x1,x0,OPEN);
		x0_x <= x0;
		x1_x <= x1;
		x2_x <= x2;
		x3_x <= x3;
		x_1: flipflop_d(ck,set,clr,x2,x1,OPEN);
		x_2: flipflop_d(ck,set,clr,x3,x2,OPEN);
		x4 	<= (x1 XOR x2);
		x4_x<= x4;
		x_3: flipflop_d(ck,set,clr,x4,x3,OPEN);
		q <= x3&x2&x1&x0;
	END PROCESS;
	
END testeapostila7pratlab5;