/**
* Fill in the architecture to build a simple ALU.
*The operands are 4 bits each.
* The operation should be performed according to the following table:
* S1  S0  Operation
* 0   0   Bitwise AND
* 0   1   Bitwise OR
* 1   0   Add
* 1   1   Subtract (A-B).
* Entidad: alu
* puertos: 
*  a : in unsigned(3 downto 0);
*  b : in unsigned(3 downto 0);
*  s : in std_logic_vector(1 downto 0);
*  y : out unsigned(3 downto 0)
*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port
    (
        a : in unsigned(3 downto 0);
        b : in unsigned(3 downto 0);
        s : in std_logic_vector(1 downto 0);
        y : out unsigned(3 downto 0)
    );
end alu;

architecture Beh of alu is
begin
    process(S,a,b)
    begin
        case S is
            when "00"   => 
                y <= a and b;
            when "01"   => 
                y <= a or  b;
            when "10"   => 
                y <= a  +  b;
            when "11"   => 
                y <= a  -  b;
            when others =>
                y <= "1111";
        end case;
    end process;
end architecture Beh;

