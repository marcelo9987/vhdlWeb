
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_enable is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  enable : in std_logic;
	  count : out unsigned(2 downto 0)
  );
end counter_enable;

architecture synth of counter_enable is
begin
    process(clk,reset,enable)
    begin
        if(rising_edge(clk))
        then
            if(reset)
            then
                count <= 3d"0";
            else
                if(enable)
                then
                    count<= count + 3d"1";
                end if;
            end if;
        end if;
    end process;
end;

