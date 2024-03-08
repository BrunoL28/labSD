-- pseudo_mux - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        RESET   : in    std_logic; -- reset input
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
    );
end pseudo_mux;

architecture arch of pseudo_mux is
	type st is (fase_1, fase_2, fase_3, fase_4); -- quatro variaveis
	signal estado : st;
	signal proximo_valor : std_logic;
begin
    process(CLOCK, RESET)
	 begin 
		if RESET = '1' then 
			estado <= fase_1;
		elsif rising_edge(CLOCK) then
			case estado is 
				when fase_1 =>
					if S = '1' then
						estado <= fase_2;
					else 
						estado <= fase_1;
					end if;
				when fase_2 =>
					if S = '1' then 
						estado <= fase_3;
					else 
						estado <= fase_2;
					end if;
				when fase_3 =>
					if S = '1' then 
						estado <= fase_4;
					else 
						estado <= fase_3;
					end if;
				when fase_4 =>
					if S = '1' then 
						estado <= fase_1;
					else 
						estado <= fase_4;
					end if;
				end case;
			end if;
		end process;
		
		Q <= proximo_valor;
		
		process(A, B, C, D, estado)
			begin
				case estado is 
					when fase_1 =>
						proximo_valor <= A;
					when fase_2 =>
						proximo_valor <= B;
					when fase_3 =>
						proximo_valor <= C;
					when fase_4 =>
						proximo_valor <= D;
				end case;
			end process;
				
end arch;