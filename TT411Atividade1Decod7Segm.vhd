ENTITY TT411Atividade1Decod7Segm IS
PORT (
	dec_in :IN INTEGER RANGE 0 TO 15;
	teste_lamp, apaga_in, ctrl_apaga_in :IN BIT;
	a, b, c, d, e, f, g, ctrl_apaga_out :OUT BIT
		);
END TT411Atividade1Decod7Segm;
ARCHITECTURE dec_7seg OF TT411Atividade1Decod7Segm IS
BEGIN
	PROCESS (dec_in, teste_lamp, apaga_in, ctrl_apaga_in)
		VARIABLE segmentos :BIT_VECTOR (0 TO 6);
			BEGIN
				IF apaga_in = '0' THEN 
					segmentos := "1111111";
					ctrl_apaga_out <= '0';
				ELSIF	teste_lamp = '0' THEN 
					segmentos := "0000000";
					ctrl_apaga_out <= '1';
				ELSIF (ctrl_apaga_in='0' AND dec_in = 0) THEN
					segmentos := "1111111";
					ctrl_apaga_out <= '0';
				ELSE
					ctrl_apaga_out <= '1';
					CASE dec_in IS
						WHEN 0 => segmentos := "0000001";
						WHEN 1 => segmentos := "1001111";
						WHEN 2 => segmentos := "0010010";
						WHEN 3 => segmentos := "0000110";
						WHEN 4 => segmentos := "1001100";
						WHEN 5 => segmentos := "0100100";
						WHEN 6 => segmentos := "1100000";
						WHEN 7 => segmentos := "0001111";
						WHEN 8 => segmentos := "0000000";
						WHEN 9 => segmentos := "0001100";
						WHEN OTHERS => segmentos := "1111111";
					END CASE;
				END IF;
		a <= segmentos(0);
		b <= segmentos(1);
		c <= segmentos(2);
		d <= segmentos(3);
		e <= segmentos(4);
		f <= segmentos(5);
		g <= segmentos(6);
	END PROCESS;
END dec_7seg;