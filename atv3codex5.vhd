-- Exemplos da Apostila 3 - exemplo 5 - pág. 10 
ENTITY atv3codex5 IS -- mux_1
	PORT (i0 , i1, i2, i3 : IN BIT; -- entradas
          s0, s1 : IN BIT; -- selecao
          ot : OUT BIT); -- saida
END atv3codex5; 

ARCHITECTURE testeatv3codex5 OF atv3codex5 IS
BEGIN 
    ot <=   i0 WHEN s1 = '0' AND s0 = '0' ELSE
            i1 WHEN s1 = '0' AND s0 = '1' ELSE 
            i2 WHEN s1 = '1' AND s0 = '0' ELSE
            i3;
END testeatv3codex5;
