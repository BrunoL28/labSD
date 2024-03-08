library ieee;
use ieee.std_logic_1164.all;

entity tb_FlipFlopD_FD is
end tb_FlipFlopD_FD;

architecture teste of tb_FlipFlopD_FD is
	component FlipFlopD_FD is
		port (
			D: in std_logic;
			CLOCK: in std_logic;
			RESET: in std_logic;
			Q: out std_logic;
			enable: in std_logic
		);
	end component;
	
	signal din : std_logic := '0';
    signal clock : std_logic := '0';
    signal dout : std_logic;
	signal enable : std_logic;
	
	constant clock_period : time := 5 ns;
	
	begin
        dut : FlipFlopD_FD
        port map (
            D => din,
            CLOCK => clock,
            RESET => '0',
            Q => dout,
            enable => enable
        );
	
	process
        begin
            while now < 100 ns loop
                clock <= '0';
                wait for clock_period / 2;
                clock <= '1';
                wait for clock_period / 2;
            end loop;
        wait;
   end process;

	process
        begin
            din <= '0';
            wait for 10 ns;
            din <= '1';
            wait for 10 ns;
            din <= '0';
            wait for 20 ns;
            din <= '1';
            wait for 30 ns;
            din <= '0';

            wait;
    end process;
	
	process
	    begin
            enable <='0';
            wait for 10 ns;
            enable <= '1';
            wait for 30 ns;
	end process;
	
end architecture teste;