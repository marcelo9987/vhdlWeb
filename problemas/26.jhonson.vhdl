library IEEE;
use IEEE.std_logic_1164.all;

entity johnson is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  count : out std_logic_vector(3 downto 0)
  );
end johnson;

architecture synth of johnson is
    signal in0,in1,in2,in3     :   std_logic;
    signal out0,out1,out2,out3 :   std_logic;
begin

    out0<=in0;
    out2<=in2;
    out1<=in1;
    out3<=in3;


  bit3 : process(clk,reset,out2)
  begin
    if(rising_edge(clk))
    then
        if(reset)
        then
            in3<='0';
        else
            in3<=out2;
        end if;
    end if;
  end process bit3;
  
  bit2 : process(clk,reset,out1)
  begin
    if(rising_edge(clk))
    then
        if(reset)
        then
            in2<='0';
        else
            in2<=out1;
        end if;
    end if;
  end process bit2;
  
  bit1 : process(clk)
  begin
    if(rising_edge(clk))
    then
        if(reset)
        then
            in1<='0';
        else
            in1<=out0;
        end if;
    end if;
  end process bit1;
  
  bit0 : process(clk)
  begin
    if(rising_edge(clk))
    then
        if(reset)
        then
            in0<='0';
        else
            in0<=not out3;
        end if;
    end if;
  end process bit0;
  count<= out3 & out2 & out1 & out0;
end architecture Synth;
