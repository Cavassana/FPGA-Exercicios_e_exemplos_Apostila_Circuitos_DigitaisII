ENTITY apostila5pag18 IS -- maq_est2 MEALY
    PORT (	ck: IN BIT; -- relogio
			sobe: IN BIT; -- estabelece o sentido
			iniciar: IN BIT; -- iniciar='1' => q="00"
			q : OUT BIT_VECTOR(1 DOWNTO 0)); -- saida
END apostila5pag18;

ARCHITECTURE testeapostila5pag18 OF apostila5pag18 IS 
-- 			q=2		q=3		q=1		q=0
TYPE st IS (caso_d, caso_c, caso_b, caso_a); -- novo tipo definido
SIGNAL estado : st; -- sinal estado tipo "st"
BEGIN 
	abc:PROCESS (ck, iniciar) -- estado inicial
	BEGIN
	IF iniciar = '1' THEN estado <= caso_a; -- estado inicial
	ELSIF (ck'EVENT AND ck = '1') THEN -- define ck como borda de subida
		CASE estado IS 
			WHEN caso_a => 								-- q=0
				IF sobe = '1' THEN estado <= caso_b; 	-- q=1
				ELSE estado <= caso_d; -- q=2
				END IF;
			WHEN caso_b => 								-- q=1
				IF sobe = '1' THEN estado <= caso_c; 	-- q=3
				ELSE estado <= caso_a; 					-- q=0
				END IF;
			WHEN caso_c => 								-- q=3
				IF sobe = '1' THEN estado <= caso_d; 	-- q=2
				ELSE estado <= caso_b; 					-- q=1
				END IF;
			WHEN caso_d => 								-- q=2
				IF sobe = '1' THEN estado <= caso_a; 	-- q=0
				ELSE estado <= caso_c; 					-- q=3
				END IF;
		END CASE;
	END IF; 
	END PROCESS abc;
	
	WITH estado SELECT -- decodifica estado
		q <="00" WHEN caso_a, -- q=0
			"01" WHEN caso_b, -- q=1
			"11" WHEN caso_c, -- q=3
			"10" WHEN caso_d, -- q=2
END testeapostila5pag18;