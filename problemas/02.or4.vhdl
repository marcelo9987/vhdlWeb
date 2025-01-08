/**
*   inputs  : a,b,c,d
*   salidas : y = a || b || c || d
*/

library IEEE;
use IEEE.std_logic_1164.all;
entity or4 is
    port
    (
        a : in  std_logic;
        b : in  std_logic;
        c : in  std_logic;
        d : in  std_logic;
        y : out std_logic
    );
end entity or4;

architecture Behaviour of or4 is
begin
    y <= a or b or c or d;
end architecture Behaviour;
