
/**
* Build an 8-bit one-hot counter 
* (i.e., one bit is high at a time, counting up from the LSB to the MSB and then repeating).
* When reset, the value should be 0000_0001.
* in/outs: clk,reset, count
*/
library IEEE;
use IEEE.std_logic_1164.all;

entity onehot is
    port(
            clk     : in    std_logic;
            reset   : in    std_logic;
            count   : out   std_logic_vector(7 downto 0)
        );
end onehot;

architecture synth of onehot is
begin
    clk_p:  process(clk)
    begin
        if (reset='1')
        then 
            count <= "00000001";
        elsif(rising_edge(clk))
        then
            count <= count(6 downto 0) & count(7);
        end if;
    end process clk_p;
end architecture;

