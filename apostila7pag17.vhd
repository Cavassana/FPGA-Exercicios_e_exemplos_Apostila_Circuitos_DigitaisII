ENTITY apostila7pag17 IS 	-- sb_prc1
PORT (	a_i, b_i, c_i 	 : IN INTEGER RANGE 0 TO 15;
		som_seq, sub_seq : OUT INTEGER RANGE 0 TO 30);
		END apostila7pag17;

ARCHITECTURE teste OF apostila7pag17 IS
-- corpo do procedimento soma_sub 
PROCEDURE soma_sub(
	-- parâmetro real: SIGNAL | parâmetro formal CONSTANT (default)
	CONSTANT a 	 : IN INTEGER RANGE 0 TO 15; 
	-- parâmetro real: VARIABLE | parâmetro formal: VARIABLE 
	VARIABLE b 	 : IN INTEGER RANGE 0 TO 15; 
	-- parâmetro real: SIGNAL | parâmetro formal: SIGNAL 
	SIGNAL c 	 : IN INTEGER RANGE 0 TO 15;
	-- parâmetro real: VARIABLE | parâmetro formal: VARIABLE 
	VARIABLE som : OUT INTEGER RANGE 0 TO 15; -- modo defaut OUT
	-- parâmetro real: SIGNAL | parâmetro formal: SIGNAL 
	SIGNAL sub 	 : OUT INTEGER RANGE 0 TO 15) IS
BEGIN
	som := a + b; 	-- variavel som :=
	sub <= a - c;	-- sinal	sub	<=
END soma_sub;
BEGIN
	abc: PROCESS(a_i, b_i, c_i)
		VARIABLE b_v, som_v : INTEGER RANGE 0 TO 15;
	BEGIN
		b_v := b_i;
		-- procedimento chamado c/ args dos tipos SIGNAL e VARIABLE
		-- em regiao sequencial
		soma_sub(a_i, b_v, c_i, som_v, sub_seq);
		som_seq <= som_v; -- saida recebe variavel som_v
	END PROCESS;
END teste;
