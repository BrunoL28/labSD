library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
	generic (
		w: integer := 32
	);
end tb_alu;

architecture teste of tb_alu is 
	component alu is 
		port (
			control: in std_logic_vector(3 downto 0);
            src1: in std_logic_vector(w - 1 downto 0);
            src2: in std_logic_vector(w - 1 downto 0);
            result: out std_logic_vector(w - 1 downto 0);
            zero: out std_logic
		);
		end component;
		
		signal CONTROL: std_logic_vector(3 downto 0);
        signal SRC1, SRC2, RESULT: std_logic_vector(w - 1 downto 0);
        signal ZERO: std_logic;
		
		begin
			instancia_alu: alu port map (
				control => CONTROL,
				src1 => SRC1,
				src2 => SRC2,
				result => RESULT,
				zero => ZER0
			);
			
			CONTROL <= "0000";
         SRC1 <= "11001100110011001100110011001100";
         SRC2 <= "10101010101010101010101010101010";
         wait for 10 ns;

         CONTROL <= "0001";  
         wait for 10 ns;

         CONTROL <= "0010";  
         wait for 10 ns;

         CONTROL <= "0110";  
         wait for 10 ns;

         CONTROL <= "0111";
         wait for 10 ns;

         CONTROL <= "1100";  
         wait for 10 ns;
		  
     end teste;