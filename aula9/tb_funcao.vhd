library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_funcao is
end entity tb_funcao;

architecture teste of tb_funcao is
	component funcao is 
		port (
			x : in std_logic_vector( 3 downto 0 );
			result : out std_logic_vector( 7 downto 0 )
		);
	end component;
	
	signal x : std_logic_vector( 3 downto 0 );
	signal result : std_logic_vector( 7 downto 0 );
	
	begin
	
		instancia_funcao : funcao port map( 
			x => x,
			result => result
		);
		
		x <= x"0", x"2" after 10 ns, x"3" after 20 ns, x"5" after 30 ns, x"6" after 40 ns;
end teste;