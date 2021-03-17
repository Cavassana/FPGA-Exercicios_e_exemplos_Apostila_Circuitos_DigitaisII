ENTITY celula_comparador IS -- celula do comparador 
PORT (ai, bi: IN BIT; -- input a, b, 
	e_ma, e_me: IN BIT;-- e_ma, e_me
	s_ma, s_me: OUT BIT); -- output s_ma, s_me
END celula_comparador;
--  s_ma = ALTO <=> a>b | s_ma = s_me = BAIXO <=> a=b.
 
ARCHITECTURE testecelula_comparador OF celula_comparador IS
BEGIN 
PROCESS(ai, bi,e_ma, e_me)
BEGIN
IF (e_ma = '1') THEN 
	s_ma <= '1'; s_me <= '0';
	ELSIF (e_me = '1') THEN
	s_ma <= '0'; s_me <= '1';
	ELSIF (e_ma = '0' AND e_me = '0') THEN
		IF (ai > bi) THEN
			s_ma <= '1'; s_me <= '0';
		ELSIF (bi > ai) THEN
			s_ma <= '0'; s_me <= '1';
		ELSIF (ai = bi) THEN
			s_ma <= '0'; s_me <= '0';
		END IF;
	END IF;
END PROCESS;
END testecelula_comparador;