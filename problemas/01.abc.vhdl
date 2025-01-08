/**
*   entidad : abc
*   inputs  : a,b,c
*   outputs : y = a&b || !b&c
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity abc is
    port
    (
        a   : in    std_logic;
        b   : in    std_logic;
        c   : in    std_logic;
        y   : out   std_logic
    );
end entity;

architecture Behaviour of abc is
    signal or_s : std_logic;
begin
    or_s <= (a and b) or ((not b) and c);
    
    y <= or_s;
end architecture Behaviour;

