ENTITY apostila4PratLab1 IS 
    PORT (bcd: IN INTEGER RANGE 0 TO 15; 
          habilita_bcd: IN BIT;
          selecao: IN INTEGER RANGE 0 TO 3; 
          habilita_selecao: IN BIT;
          display: OUT INTEGER RANGE 0 TO 3; 
		  a, b, c, d, e, f, g: OUT BIT);
END apostila4PratLab1;

ARCHITECTURE testeapostila4PratLab1 OF apostila4PratLab1 IS 
BEGIN 
PROCESS(bcd, habilita_bcd, selecao, habilita_selecao)
VARIABLE segmentos : BIT_VECTOR(0 TO 6); 
	BEGIN
    IF habilita_bcd = '1' THEN
        CASE bcd IS 
            WHEN 0 => segmentos := "1111110";
            WHEN 1 => segmentos := "0110000";
            WHEN 2 => segmentos := "1101101";
            WHEN 3 => segmentos := "1111001";
            WHEN 4 => segmentos := "0110011";
            WHEN 5 => segmentos := "1011011";
            WHEN 6 => segmentos := "1011111";
            WHEN 7 => segmentos := "1110000";
            WHEN 8 => segmentos := "1111111";
            WHEN 9 => segmentos := "1110011";
            WHEN OTHERS => segmentos := "0000000";
        END CASE;
        a <= segmentos(0);
        b <= segmentos(1);
        c <= segmentos(2);
        d <= segmentos(3);
        e <= segmentos(4);
        f <= segmentos(5);
        g <= segmentos(6);
    END IF;
END PROCESS;
PROCESS(selecao, habilita_selecao)	
BEGIN
    IF 	habilita_selecao = '0' THEN 
		display <= selecao;
	 END IF;
END PROCESS;
END testeapostila4PratLab1;