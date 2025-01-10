library IEEE;
use IEEE.std_logic_1164.all;

entity twohigh is
  port(
	  clk : in std_logic;
    input : in std_logic;
	  two : out std_logic
  );
end twohigh;

architecture synth of twohigh is
    signal clk_s1, clk_s2   : std_logic;
    signal salida_dff1      : std_logic;
    signal salida_dff2      : std_logic;
begin

    d_ff1 : process(clk,input)
        begin
            if(rising_edge(clk))
            then
                salida_dff1 <=  input;
            end if;
        end process d_ff1;
    
    d_ff2 : process(clk,salida_dff1)
    begin
        if(rising_edge(clk))
        then
            salida_dff2 <=  salida_dff1;
        end if;
    end process d_ff2;

    two <= salida_dff1 and salida_dff2;
end;

