library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mean_4_clocks is
end entity tb_mean_4_clocks;

architecture test of tb_mean_4_clocks is
	component mean_4_clocks is
		generic (
			W: integer := 4
		);
		port (
			CLK, RESET: in std_logic;
			INPUT: in std_logic_vector(W - 1 downto 0);
			OUTPUT: out std_logic_vector(W - 1 downto 0)
		);
	end component;
	
	signal W: integer := 4;
	signal CLK, RESET: std_logic;
	signal INPUT, OUTPUT: std_logic_vector(W - 1 downto 0);
	
	begin
	
	instancia_mean_4_clocks: mean_4_clocks
	
		port map (
			CLK => CLK,
			RESET => RESET,
			INPUT => INPUT,
			OUTPUT => OUTPUT
		 );

        CLK <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns,
		'1' after 35 ns, '0' after 40 ns, '1' after 45 ns;
		
		RESET <= '1', '0' after 3 ns;
		
		INPUT <= x"1", x"2" after 14 ns, x"3" after 28 ns, x"4" after 43 ns, x"5" after 59 ns;

end test;