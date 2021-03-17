ENTITY apostila7pag18 IS	-- sb_prc12
PORT (	ck, d : IN BIT;
		q, q_b: BUFFER BIT);
END apostila7pag18;

ARCHITECTURE teste OF apostila7pag18 IS
-- entradas e saídas com parâ. formais do tipo SIGNAL
PROCEDURE flip_d(SIGNAL relogio, dado: IN BIT;
				SIGNAL valor, valor_b: OUT BIT) IS
BEGIN
-- referência aos atributos devido a declaração formal SIGNAL dos inputs
	IF (relogio'EVENT AND relogio = '1') THEN
		valor <= dado;			
		valor_b <= NOT dado;
	END IF;
END flip_d;

BEGIN
	abc: PROCESS (ck)
	BEGIN
		-- procedimento chamado em regiao sequencial
		flip_d(relogio => ck, dado => d, valor => q, valor_b => q_b);
	END PROCESS abc;
END teste;

