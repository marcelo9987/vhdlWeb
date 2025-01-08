/**
*   The 3-bit input represents the values 0-7, and the result should have the corresponding number of bits set high 
*   on the output. The bits should go on from "least" to "greatest", like mercury rising in a thermometer.
*   Entidad : thermometer
*   Entradas: value (logic_vector de tamanho 3)
*   Salidas : therm (logic_vector de tamanho 7)
*/
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity thermometer is
    port
    (
        value   : in  std_logic_vector (2 downto 0);
        therm   : out std_logic_vector (6 downto 0)
    );
end entity;

architecture Behaviour of thermometer is
begin

process(value)
begin
    for posicion in 0 to 6 loop
        if ( to_integer(unsigned(value)) > posicion)then
            therm(posicion) <= '1';
        else
            therm(posicion) <= '0';
        end if;
    end loop;
end process;

end architecture Behaviour;

