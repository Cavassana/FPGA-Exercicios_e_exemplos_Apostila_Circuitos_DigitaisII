-- 2. Apresente o código de um somador de 4 bits empregando unidades de um somador completo de 1 bit. 
-- Cada somador completo é implementado por um procedimento contendo três entradas e duas saídas: soma e vai um. 
-- A arquitetura deve realizar a chamada dos procedimentos de uma região de código concorrente.

ENTITY apostila7pratlab2 IS 
GENERIC (n : INTEGER := 4);
	PORT (a_x, b_x		: IN BIT_VECTOR(n-1 DOWNTO 0); -- entradas
			cin_0 		: IN BIT;
			overflow 	: OUT BIT;
			res_soma 	: OUT BIT_VECTOR(n-1 DOWNTO 0));
END apostila7pratlab2;

ARCHITECTURE testeapostila7pratlab2 OF apostila7pratlab2 IS

-- corpo do procedimento: apostila6pag5 
PROCEDURE	soma_proc(a, b, ve		: IN BIT; 		-- para. form: CONSTAN
					SIGNAL s, vs	: OUT BIT) IS 	-- para. form: SIGNAL

BEGIN
	s <= a XOR b XOR ve;                        -- soma
	vs<= (a AND b) OR (a AND ve) OR (b AND ve); -- vai um (overflow)
END soma_sub;

SIGNAL som_0, som_1, som_2, som_3	  : BIT;
SIGNAL cout_0, cout_1, cout_2, over_f : BIT;

BEGIN 
	res_soma  <= soma_proc(a_x(3),b_x(3),cout_2,som_3,over_f)
				&soma_proc(a_x(2),b_x(2),cout_1,som_2,cout_2)
				&soma_proc(a_x(1),b_x(1),cout_0,som_1,cout_1)
				&soma_proc(a_x(0),b_x(0),cin_0 ,som_0,cout_0);
	overflow <= over_f;
	
END testeapostila7pratlab2;
