library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

ENTITY apostila7pag11 IS -- sb_fct0
PORT (a_i, b_i : IN INTEGER RANGE 0 TO 15;
	s_conc : OUT INTEGER RANGE 0 TO 15);
END apostila7pag11;

ARCHITECTURE exemplo OF apostila7pag11 IS

FUNCTION soma (a : INTEGER; b : INTEGER) RETURN INTEGER IS
	VARIABLE s : INTEGER;
BEGIN
	s := a + b;
	RETURN s;
END soma;

BEGIN
	s_conc <= soma(a_i, b_i);
END exemplo;
