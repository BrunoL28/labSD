library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity comparador is
    port (
        x, y: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(1 downto 0)
    );
end entity comparador;

architecture rtl of comparador is
    begin
        process(x, y)
            begin
                if (x > y) then
                    s <= "10";
                elsif (x = y) then
                    s <= "00";
                elsif (x < y) then
                    s <= "01";
                end if;
        end process;
end architecture rtl;