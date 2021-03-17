ENTITY std_xc IS -- std_xc
PORT (bv_a, bv_b : IN BIT_VECTOR (1 DOWNTO 0);
		int_a, int_b: IN INTEGER RANGE -32 to 31;
		bv_c, bv_d : OUT BIT_VECTOR (3 DOWNTO 0);
		int_c : OUT INTEGER RANGE -64 TO 63);
END;

ARCHITECTURE  teste OF std_xc  IS
BEGIN
	bv_c <= bv_a & bv_b;
	bv_d <= bv_a & '1' & '0';
	int_c <= -int_a +int_b;
END;