ENTITY apostila7pag16 IS 	-- sb_prc0
PORT (	a_i, b_i, c_i : IN INTEGER RANGE 0 TO 15;
		som_con, sub_con : OUT INTEGER RANGE 0 TO 30);
		END apostila7pag16;

ARCHITECTURE teste OF apostila7pag16 IS
-- corpo do procedimento soma_sub 
PROCEDURE soma_sub( a, b, c 		: IN INTEGER RANGE 0 TO 15; -- assume tipo CONSTANT
					SIGNAL som, sub : OUT INTEGER RANGE 0 TO 30) IS
BEGIN
	som <= a + b; -- retorna dois sinais e não faz uso do RETURN
	sub <= a - c; 
END soma_sub;
BEGIN
-- procedimemnto chamada c/ args a_i, b_i e c_i em regiao concorrente
	soma_sub(a_i, b_i, c_i, som_con, sub_con); -- som_con <= som e sub_con <= sub
END teste;
