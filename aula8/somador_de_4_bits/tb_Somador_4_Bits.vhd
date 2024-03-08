library ieee;
use ieee.std_logic_1164.all;

entity tb_Somador_4_Bits is
end tb_Somador_4_bits;

architecture teste of tb_Somador_4_Bits is
	component Somador_4_Bits is
		port (
			x : in std_logic_vector;
			y : in std_logic_vector;
			Cin : in std_logic;
			s: out std_logic_vector;
			Cout : out std_logic
		);
	end component;
	
	signal A, B, S : std_logic_vector(3 downto 0);
	signal entrada, Cout : std_logic;
	
	begin
	instancia_Somador_4_Bits : Somador_4_Bits port map(
		Cin => entrada,
		x => A,
		y => B,
		S => s,
		Cout => Cout
	);
	A <= x"0", x"5" after 10 ns, x"2" after 20 ns, x"1" after 30 ns, x"3" after 40 ns, x"8" after 50 ns, x"3" after 60 ns;
	B <= x"0", x"2" after 10 ns ,x"3" after 20 ns, x"2" after 30 ns, x"1" after 40 ns, x"8" after 50 ns, x"1" after 60 ns;
	entrada <= '0';
end architecture teste;