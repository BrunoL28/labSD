library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    generic (
        w :       integer := 32
    );
    port (
        control : in    std_logic_vector(3 downto 0);
        src1    : in    std_logic_vector(w - 1 downto 0);
        src2    : in    std_logic_vector(w - 1 downto 0);
        result  : out   std_logic_vector(w - 1 downto 0);
        zero    : out   std_logic
    );
end alu;

architecture arch of alu is
begin
    process(control, src1, src2)
    begin
        if (control = "0000") then
            result <= src1 and src2;
        elsif (control = "0001") then
            result <= src1 or src2;
        elsif (control = "0010") then
            result <= std_logic_vector(resize(unsigned(src1), w) + resize(unsigned(src2), w));
        elsif (control = "0110") then
            result <= std_logic_vector(resize(unsigned(src1), w) - resize(unsigned(src2), w));
        elsif (control = "0111") then
            if unsigned(src1) < unsigned(src2) then
                result <= (others => '1');
            else
                result <= (others => '0');
            end if;
        elsif (control = "1100") then
            result <= not (src1 or src2);
        end if;
    end process;
end arch;
