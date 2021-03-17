ENTITY apostila5pag15 IS -- maq_est1 MOORE
    PORT (	ck: IN BIT; -- relogio
			rst: IN BIT; -- rst=1 leva q-000 
			q : BUFFER BIT_VECTOR(1 DOWNTO 0)); -- saida codigo Gray
END apostila5pag15;

ARCHITECTURE testeapostila5pag15 OF apostila5pag15 IS 
BEGIN 
	abc:PROCESS (ck, rst)
	BEGIN
		IF (rst = '1') THEN q <= "00"; -- estado inicial
		ELSIF (ck'EVENT AND ck = '1') THEN -- borda de subida
			CASE q IS 
				WHEN "00" => q <= "01";
				WHEN "01" => q <= "11";
				WHEN "11" => q <= "10";
				WHEN "10" => q <= "00";
			END CASE;
		END IF; 
	END PROCESS abc;
END testeapostila5pag15;