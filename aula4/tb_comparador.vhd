library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_comparador is
end tb_comparador;

architecture teste of tb_comparador is
	component comparador is
		port (
			x, y: in std_logic_vector(3 downto 0);
			s: out std_logic_vector(1 downto 0)
		);
	end component;
	
	signal A, B: std_logic_vector(3 downto 0);
	signal S: std_logic_vector(1 downto 0);
	
	begin
		instancia_comparador: comparador port map(x=>A,y=>B,s=>S);
		A <= x"0", x"3" after 10 ns, x"5" after 20 ns, x"8" after 30 ns;
		B <= x"0", x"4" after 10 ns, x"3" after 20 ns, x"8" after 30 ns;

end teste; 