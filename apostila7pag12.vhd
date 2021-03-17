ENTITY apostila7pag12 IS -- sb_fct1
PORT (a_i, b_i : IN INTEGER RANGE 0 TO 15;	-- entradas
	-- limite do lado direito alterado de 15 para 30
		s_sequ : OUT INTEGER RANGE 0 TO 30);
END apostila7pag12;

ARCHITECTURE exemplo OF apostila7pag12 IS
-- corpo da função soma 
-- parâmetro formal das entradas: CONSTANT
FUNCTION soma (a : INTEGER; b : INTEGER) RETURN INTEGER IS
	BEGIN
	RETURN a + b;
END soma;

BEGIN
	abc: PROCESS(a_i, b_i)
		VARIABLE a, b: INTEGER RANGE 0 TO 15;
	BEGIN
		a := a_i; b := b_i;
		-- funcao chamada c/ args a e b em regiao sequencial
		s_sequ <= soma(a, b);
	END PROCESS;
END exemplo;
