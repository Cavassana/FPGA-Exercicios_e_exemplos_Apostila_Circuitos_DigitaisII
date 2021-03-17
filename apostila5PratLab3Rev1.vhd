ENTITY apostila5PratLab3Rev1 IS -- Reg. deslocamento - TTL74166
    PORT (	ck: IN BIT;
			ce: IN BIT;
			rst: IN BIT; 					-- rst='0' qv="00000000"
			shiftORload: IN BIT; 			-- load data sincrono
			ds: IN BIT; 					-- entrada serial  |d[7] primeiro ff = entrada de ds| e |d[0] ultimo ff = saida do reg|
			dn: IN BIT_VECTOR(7 DOWNTO 0);	--d[7]d[6]d[5]d[4]d[3]d[2]d[1]d[0]
			saida_do_reg: OUT BIT); 		--QH
END apostila5PratLab3Rev1;

ARCHITECTURE testeapostila5PratLab3Rev1 OF apostila5PratLab3Rev1 IS 
BEGIN 
	reg74166:PROCESS (ck, rst) -- sensivel a ck ou rst
	VARIABLE qv : BIT_VECTOR(7 DOWNTO 0);
	BEGIN
	saida_do_reg<=qv(0); 							-- saida recebe o valor do ultimo ff qv(0)
	IF rst = '0' THEN qv := "00000000"; 			-- qv="00000000" independe de ck
	ELSIF ce = '1' THEN 							-- ce habilita ou desabilita operacoes sincronas
 		IF (ck'EVENT AND ck = '1') THEN 			-- define ck como borda de subida  
			IF (shiftORload = '0') THEN qv := dn; 	-- carrega dados (load)
			ELSE 									-- Desloca (shift) para direita 
				qv(6 DOWNTO 0) := qv(7 DOWNTO 1);		
				qv(7) := ds;
			END IF;
		END IF;	
	END IF; 
	END PROCESS reg74166;
END testeapostila5PratLab3Rev1;

-- ** desloca para esquerda : 
-- 1- incluir input de direcao 
-- IF (shiftORload = '0') THEN qv := dn; -- carrega dados (load)
-- ELSE -- Desloca (shift) para esquerda 
-- 		qv(7 DOWNTO 1) := qv(6 DOWNTO 0);		
--		qv(0) := ds;
-- END IF;