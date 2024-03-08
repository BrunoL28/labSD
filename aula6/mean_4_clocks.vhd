-- mean_4_clocks - A system that calculates the mean over four clocks
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
use ieee.numeric_std.all;

entity mean_4_clocks is
    generic (
        W: integer := 4
    );
    port (
        CLK: in std_logic;
        RESET: in std_logic;
        INPUT: in std_logic_vector(W - 1 downto 0);
        OUTPUT: out std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

architecture arch of mean_4_clocks is
begin
    process(CLK, RESET, INPUT) is
        variable var1 : unsigned(W - 1 downto 0) := x"0";
        variable var2 : unsigned(W - 1 downto 0) := x"0";
        variable var3 : unsigned(W - 1 downto 0) := x"0";
        variable var4 : unsigned(W - 1 downto 0) := x"0";
        variable media : unsigned(W - 1 downto 0) := x"0";
		  
    begin
        if (RESET = '1') then
            var1 := to_unsigned(0, W);
            var2 := to_unsigned(0, W);
            var3 := to_unsigned(0, W);
            var4 := to_unsigned(0, W);
        else
            var2 := var1;
            var3 := var2;
            var4 := var3;
				var1 := unsigned(INPUT);
        end if;

        media := (var1 + var2 + var3 + var4);

		  OUTPUT <= std_logic_vector("00" & media(W - 1 downto 2));
    end process;
end arch;