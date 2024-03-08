library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port ( 
		 CIN : in std_logic;
       X   : in std_logic;
       Y   : in std_logic;
       S   : out std_logic;
       COUT : out std_logic
     );
end FullAdder;

architecture comportamental OF FullAdder is
begin
    process( CIN, X, Y )
		variable sum : std_logic;
	begin
		sum := (X xor Y xor CIN);
		S <= sum;
		COUT <= (X and Y) or (CIN and X) or (CIN and Y);
	end process;
end architecture comportamental;