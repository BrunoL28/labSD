library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--f(x)= r*x*not(x)

entity funcao is 
	port (
		x : in std_logic_vector( 3 downto 0 );
		result : out std_logic_vector( 7 downto 0 )
	);
end entity funcao;

-- Precedencia
-- Parenteses
-- NOT
-- AND
-- OR

architecture data_flow of funcao is 
	signal a : std_logic_vector( 7 downto 0 );
	signal b : unsigned( 7 downto 0 );
	
	begin
	
		a <= std_logic_vector( unsigned( x ) * unsigned( not x ));
		b <= unsigned( a ) sll 1;
		result <= std_logic_vector( b );
end architecture data_flow;