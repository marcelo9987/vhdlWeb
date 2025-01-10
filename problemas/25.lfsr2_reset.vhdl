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

entity lfsr2 is
  port(
    clk : in std_logic;
    reset : in std_logic;
    b : out std_logic
  );
end lfsr2;

architecture synth of lfsr2 is
component d_ff is
    port
    (
        d   : in    std_logic;
        clk : in    std_logic;
        y   : out   std_logic
    );
end component d_ff;
signal mux1,mux2    : std_logic;
signal d_1o,d_2o            : std_logic;
begin
d_1:d_ff port map(mux1,clk,d_1o);
d_2:d_ff port map(mux2,clk,d_2o);

process(reset,d_1o,d_2o)
begin
    if(reset='1')
    then
        mux1 <= '1';
        mux2 <= '1';
    else
        mux1 <= d_2o xor d_1o;
        mux2 <= d_1o;
    end if;
end process;
    b <= d_2o;
end;

