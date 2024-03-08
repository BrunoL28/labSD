library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD_FD is
	port (
		D: in std_logic;
		CLOCK: in std_logic;
		RESET: in std_logic;
		Q: out std_logic;
		enable: in std_logic
	);
end entity FlipFlopD_FD;

architecture Fluxo_de_Dados of FlipFlopD_FD is 
	signal fluxo_de_dados: std_logic;
	
	begin
		process( CLOCK, RESET )
			begin
				if enable = '1' then
					if rising_edge(CLOCK) then
						fluxo_de_dados <= D;
					end if;
				end if;
				
				if RESET = '1' then
					fluxo_de_dados <= '0';
				end if;
			end process;
			
			Q <= fluxo_de_dados;
end architecture Fluxo_de_Dados;