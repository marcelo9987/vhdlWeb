library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio;

entity bitrender is
  port(
    clk : in std_logic;
    row : in unsigned(2 downto 0); -- vertical position, 0 to 7
    col : in unsigned(5 downto 0); -- horizontal position, 0 to 63
    pixel : out std_logic
  );
end;

architecture synth of bitrender is

component rom is
  port(
    clk : in std_logic;
    addr : in std_logic_vector(5 downto 0); -- 64 words total
    data : out std_logic_vector(7 downto 0) -- 8-bit words
  );
end component;

signal addr : std_logic_vector(5 downto 0);
signal data : std_logic_vector(7 downto 0); -- Memory has 8-bit words

begin
addr <=  std_logic_vector(to_unsigned(to_integer(col/8) + to_integer(row) * 8,6));

-- process(addr)
-- begin

-- report 
--         "col: " 
--       & integer'image(to_integer(col/8))
--       & " row: " 
--       & integer'image(to_integer(row))
--       & " word " 
--       & integer'image(to_integer(to_unsigned(to_integer(col/8) + to_integer(row) * 8,6)));
-- end process;
    
rom1: rom port map(addr=>addr,clk=>clk,data=>data);
pixel <= data(to_integer(d"7" - (col mod 8)));
end;

