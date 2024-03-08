library ieee;
use ieee.std_logic_1164.all;

entity Somador_4_Bits is
	port (
		x : in std_logic_vector(3 downto 0);
		y : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		s: out std_logic_vector(3 downto 0);
		Cout : out std_logic
	);
end Somador_4_Bits;

architecture estrutural of Somador_4_Bits is
	component FullAdder
	port (
		x, y, Cin : in std_logic;
		s, Cout : out std_logic
	);
	end component;
	
	signal Cout0, Cout1, Cout2 : std_logic;
	
	begin
	S0: FullAdder port map(Cin => Cin, x => x(0), y => y(0), s => s(0), Cout => Cout0);
	S1: FullAdder port map(Cin => Cout0, x => x(1), y => y(1), s => s(1), Cout => Cout1);
	S2: FullAdder port map(Cin => Cout1, x => x(2), y => y(2), s => s(2), Cout => Cout2);
	S3: FullAdder port map(Cin => Cout2, x => x(3), y => y(3), s => s(3), Cout => Cout);
	
end architecture estrutural;