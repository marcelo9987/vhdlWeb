
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity countto is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  count : out unsigned(3 downto 0)
  );
end countto;

architecture synth of countto is
signal count_s : unsigned(3 downto 0);
begin
    process(clk)
    begin
        if(rising_edge(clk))
        then
            if(reset = '1')
            then
                count_s <= "0000";
            else
                if(count_s = 9)
                then
                    count_s <= "0000";
                else
                count_s <= count_s + 1;
            end if;
            end if;
        end if;
    end process;
    count <= count_s;
end architecture synth;

