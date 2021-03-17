-- 2. Apresente o código VHDL, com comentários, que implemente a máquina de estado 
-- do controlador de seta e alerta do veículo Thunderbird 1965, conforme instruções a seguir.   
-- 
-- Estado da Alavanca	Ação
-- Posição neutra			Mantem a saída em 0000
-- Para cima	        Fica repetindo a sequência nas 3 lâmpadas do lado esquerdo 000 – 001- 011 - 111
-- Para baixo	        Fica repetindo a sequência nas 3 lâmpadas do lado direito 000 – 100- 110 - 111 
-- Para trás	        Fica alternando as 6 lâmpadas traseiras em 000000 - 111111

ENTITY ControleSetasThunderbird IS -- 
    PORT (	ck: IN BIT; -- relogio				 
			alavanca: IN BIT_VECTOR(1 DOWNTO 0); -- decodificao na linha abaixo:
-- posicao da alavanca  => neutro => alavanca="00" | seta_dir => alavanca="01" | seta_esq => alavanca="10" | emergencia => alavanca="11" |
			lanterna_esq : OUT BIT_VECTOR(2 DOWNTO 0);	-- saida lanterna esquerda
			lanterna_dir : OUT BIT_VECTOR(2 DOWNTO 0)); -- saida lanterna direita
END ControleSetasThunderbird;

ARCHITECTURE testeControleSetasThunderbird OF ControleSetasThunderbird IS 
-- 				   "000"	  "100"		"110"	   "111"	  "001"	 	  "011"
TYPE st_lamp IS (estagio_0, estagio_1, estagio_2, estagio_3, estagio_4, estagio_5); -- define variavel para o lanterna esquerda
SIGNAL estado_lanterna_dir : st_lamp; -- estado lampadas direita
SIGNAL estado_lanterna_esq : st_lamp; -- estado lampadas esquerdo
BEGIN 
	configura_estado:PROCESS (ck, alavanca) -- sensivel a ck e a alavanca
	BEGIN
		IF alavanca = "00" THEN -- estado neutro
			estado_lanterna_esq <= estagio_0; 							
			estado_lanterna_dir <= estagio_0;
		ELSIF (ck'EVENT AND ck = '1') THEN 								-- define ck como borda de subida
			IF alavanca = "11" THEN 									-- emergencia => alavanca="11" 
				CASE estado_lanterna_esq IS
					WHEN estagio_0 => estado_lanterna_esq <= estagio_3;	
					WHEN estagio_3 => estado_lanterna_esq <= estagio_0;
					WHEN OTHERS => NULL;
				END CASE;	
				CASE estado_lanterna_dir IS
					WHEN estagio_0 => estado_lanterna_dir <= estagio_3;	
					WHEN estagio_3 => estado_lanterna_dir <= estagio_0;
					WHEN OTHERS => NULL;
				END CASE;	
			ELSIF alavanca = "01" THEN 									-- seta_dir => alavanca="01"
				estado_lanterna_esq <= estagio_0;						-- trava a lanterna esquerda
				CASE estado_lanterna_dir IS 							-- define os proximos estagios
					WHEN estagio_0 => estado_lanterna_dir <= estagio_1;	-- "000" -> "100" 
					WHEN estagio_1 => estado_lanterna_dir <= estagio_2;	-- "100" -> "110"					
					WHEN estagio_2 => estado_lanterna_dir <= estagio_3;	-- "110" -> "111"							-
					WHEN estagio_3 => estado_lanterna_dir <= estagio_0;	-- "111" -> "000"
					WHEN OTHERS => NULL;			
				END CASE; 
			ELSIF alavanca = "10" THEN 									-- seta_esq => alavanca="10" 
				estado_lanterna_dir <= estagio_0;						-- trava a lanterna esquerda
				CASE estado_lanterna_esq IS 							-- define os proximos estagios
					WHEN estagio_0 => estado_lanterna_esq <= estagio_4;	-- "000" -> "001" 
					WHEN estagio_4 => estado_lanterna_esq <= estagio_5;	-- "001" -> "011"					
					WHEN estagio_5 => estado_lanterna_esq <= estagio_3;	-- "011" -> "111"
					WHEN estagio_3 => estado_lanterna_esq <= estagio_0;	-- "111" -> "000"	
					WHEN OTHERS => NULL;	
				END CASE; 
			END IF;
		END IF;
	END PROCESS configura_estado;
	
	WITH estado_lanterna_dir SELECT	
			lanterna_dir <=	"000" WHEN estagio_0, 					-- "000"
									"100" WHEN estagio_1, 		 	-- "100"
									"110" WHEN estagio_2, 			-- "110"
									"111" WHEN estagio_3, 			-- "111"
									"001" WHEN estagio_4, 			-- "001"
									"011" WHEN estagio_5; 			-- "011"
	WITH estado_lanterna_esq SELECT	
			lanterna_esq <=	"000" WHEN estagio_0, 					-- "000"
									"100" WHEN estagio_1, 		 	-- "100"
									"110" WHEN estagio_2, 			-- "110"
									"111" WHEN estagio_3, 			-- "111"
									"001" WHEN estagio_4, 			-- "001"
									"011" WHEN estagio_5; 			-- "011"	
END testeControleSetasThunderbird;
		