library IEEE;
use IEEE.std_logic_1164.all;

entity d_ff is
    port
    (
        d   : in    std_logic;
        clk : in    std_logic;
        y   : out   std_logic
    );
end entity;



architecture beh of d_ff is 
begin
    process(clk,d)
    begin
        if(rising_edge(clk))
        then
            y<=d;
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.std_logic_1164.all;

entity lfsr4 is
  port(
	  clk : in std_logic;
	  reset : in std_logic;
	  count : out std_logic_vector(3 downto 0)
  );
end lfsr4;

architecture synth of lfsr4 is
component d_ff is
    port
    (
        d   : in    std_logic;
        clk : in    std_logic;
        y   : out   std_logic
    );
end component d_ff;
signal in3, in2, in1, in0   : std_logic;
signal d_3o, d_2o, d_1o, d_0o   : std_logic;
begin
    d_3:d_ff port map(in3,clk,d_3o);
    d_2:d_ff port map(in2,clk,d_2o);
    d_1:d_ff port map(in1,clk,d_1o);
    d_0:d_ff port map(in0,clk,d_0o);
process(clk,reset,in3,in2,in1,in0)
begin
    if(reset='1')
    then
        in3 <= '0';
        in2 <= '0';
        in1 <= '0';
        in0 <= '1';
    else
        in3 <= d_0o;
        in2 <= d_3o xor d_0o;
        in1 <= d_2o;
        in0 <= d_1o;
    end if;
end process;
    count <= d_3o & d_2o & d_1o & d_0o;
end;
