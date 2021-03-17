-- Exemplos da Apostila 3 - exemplo 6 - pág. 13
ENTITY atv3codex6 IS -- mux_9 - WHIT SELECT
	PORT (i0 , i1, i2, i3 : IN BIT; -- entradas
          s0, s1 : IN BIT; -- selecao
          ot : OUT BIT); -- saida
END atv3codex6; 

ARCHITECTURE testeatv3codex6 OF atv3codex6 IS
    SIGNAL sel : BIT_VECTOR (1 DOWNTO 0);
BEGIN 
    sel <= s1 & s0;
    WITH sel SELECT 
    ot <=   i0 WHEN "00",
            i1 WHEN "01",
            i2 WHEN "10",
            i3 WHEN "11";
END testeatv3codex6;
