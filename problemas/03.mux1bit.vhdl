/**
* Objetivo  : construir un multiplexor 2 a 1.
* entidad   : mux1bit
* in        : a, b, s(seleccion)
* out       : y = si (s) alto => b; si (s) bajo => a;
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity mux1bit is
    port
    (
        a : in  std_logic;
        b : in  std_logic;
        s : in  std_logic;
        y : out std_logic 
    );
end;

architecture Behaviour of mux1bit is

begin
    y <= 
            a when s='0'
        else 
            b;
end architecture Behaviour;

