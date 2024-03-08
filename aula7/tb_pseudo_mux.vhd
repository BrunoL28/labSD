library ieee;
use ieee.std_logic_1164.all;

entity tb_pseudo_mux is
end tb_pseudo_mux;

architecture teste of tb_pseudo_mux is 
	component pseudo_mux is 
		port (
		  RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
		);
	end component;
	
	signal CLOCK, RESET, fase_1, fase_2, fase_3, fase_4, S, Q : std_logic;
	
	begin 
		instancia_pseudo_mux: pseudo_mux port map(
			CLOCK => CLOCK,
			RESET => RESET,
			A => fase_1,
			B => fase_2,
			C => fase_3,
			D => fase_4,
			S => S,
			Q => Q
		);
		
		CLOCK<='0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns, '1' after 85 ns, '0' after 90 ns, '1' after 95 ns, '0' after 100 ns;
		RESET<='1', '0' after 10 ns;
		fase_1<='1', '0' after 20 ns, '1' after 40 ns, '0' after 60 ns, '1' after 80 ns;
		fase_2<='0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns;
		fase_3<='1', '0' after 30 ns, '1' after 60 ns, '0' after 90 ns;
		fase_4<='0', '1' after 65 ns, '0' after 95 ns;
		S<='0', '1' after 33 ns, '0' after 38 ns, '1' after 53 ns, '0' after 58 ns, '1' after 63 ns, '0' after 68 ns, '1' after 77 ns, '0' after 83 ns, '1' after 88 ns, '0' after 95 ns;
		
end teste;