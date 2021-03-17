-- Exemplos da Apostila 3 - exemplo 7 - pág. 15
ENTITY atv3codex7 IS -- mux_5 - BLOCK
	PORT (i0 , i1, i2, i3 : IN BIT; -- entradas
          sel : IN INTEGER RANGE 3 DOWNTO 0; -- selecao
          ot : OUT BIT); -- saida
END atv3codex7; 

ARCHITECTURE testeatv3codex7 OF atv3codex7 IS
    SIGNAL global : BIT_VECTOR (0 TO 1);
BEGIN 
    abc : BLOCK
    BEGIN
		ot <= i0 WHEN global = "00" ELSE
            i1 WHEN global = "01" ELSE
            i2 WHEN global = "10" ELSE
            i3;
    END BLOCK abc;

    def: BLOCK
        SIGNAL interno_abc : BIT_VECTOR(0 TO 1); -- sinal visivel no bloco abc
    BEGIN 
        WITH sel SELECT 
           interno_abc <=  "00" WHEN 0,
                           "01" WHEN 1,
                           "10" WHEN 2,
                           "11" WHEN OTHERS;
        global <= interno_abc;
    END BLOCK def;
END testeatv3codex7;
