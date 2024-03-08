library ieee;
use ieee.std_logic_1164.all;

entity tb_FullAdder is 
end tb_FullAdder;

architecture teste of tb_FullAdder is 
	component FullAdder is
		port (
			CIN : in std_logic;
         X   : in std_logic;
         Y   : in std_logic;
         S   : out std_logic;
         COUT : out std_logic
		);
	end component;
	signal CLOCK, CIN, X, Y, S, COUT : std_logic;

begin

    instancia_fulladder: FullAdder port map (
        CIN   => CIN,
        X     => X,
        Y     => Y,
        S     => S,
        COUT  => COUT
    );

    CLOCK <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns, '1' after 85 ns, '0' after 90 ns, '1' after 95 ns, '0' after 100 ns;
    CIN   <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns, '0' after 100 ns;
    X     <= '0', '1' after 15 ns, '0' after 30 ns, '1' after 45 ns, '0' after 60 ns, '1' after 75 ns, '0' after 90 ns, '1' after 100 ns;
    Y     <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns;

end teste;