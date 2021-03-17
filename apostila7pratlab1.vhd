--1- No quadro a seguir são apresentadas duas funções que realizam as operações de um somador completo. 
-- Apresente a descrição de um somador de 4 bits empregando essas duas funções, sendo a chamada das funções executada de uma região de código concorrente.

ENTITY apostila7pratlab1 IS 
GENERIC (n : INTEGER := 4);
	PORT (a_x, b_x		: IN BIT_VECTOR(n-1 DOWNTO 0); -- entradas
			cin_0 		: IN BIT;
			overflow 	: OUT BIT;
			res_soma 	: OUT BIT_VECTOR(n-1 DOWNTO 0));
END apostila7pratlab1;

ARCHITECTURE testeapostila7pratlab1 OF apostila7pratlab1 IS

FUNCTION soma (a : IN BIT; b : IN BIT; c : IN BIT) RETURN BIT IS -- função soma 
	BEGIN
	RETURN a XOR b XOR c;
END soma;

FUNCTION vai_um (a: BIT; b: BIT; c: BIT) RETURN BIT IS -- função vai_um 
	BEGIN
	RETURN (a AND b) OR (a AND c) OR (b AND c);
END vai_um;

SIGNAL som_0, som_1, som_2, som_3	  : BIT;
SIGNAL cout_0, cout_1, cout_2, over_f : BIT;

BEGIN 

	som_0  <= soma(a_x(0),b_x(0),cin_0); 	-- -sign.
	cout_0 <= vai_um(a_x(0),b_x(0),cin_0);
	som_1  <= soma(a_x(1),b_x(1),cout_0); 	
	cout_1 <= vai_um(a_x(1),b_x(1),cout_0);
	som_2  <= soma(a_x(2),b_x(2),cout_1); 	
	cout_2 <= vai_um(a_x(2),b_x(2),cout_1);
	som_3  <= soma(a_x(3),b_x(3),cout_2); 	-- +sign.
	over_f <= vai_um(a_x(3),b_x(3),cout_2); -- overflow
	
	res_soma <= som_3&som_2&som_1&som_0;
	overflow <= over_f;
	
END testeapostila7pratlab1;