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
    signal ab_s, aorb_s,amasb_s,amenosb_s : unsigned(3 downto 0);
begin
    ab_s        <= a and b;
    aorb_s      <= a or  b;
    amasb_s     <= a +   b;
    amenosb_s   <= a -   b;
    
    with S select y <=
            ab_s        when "00"
        ,   aorb_s      when "01"
        ,   amasb_s     when "10"
        ,   amenosb_s   when "11"
        ,   "1111"      when others;
end architecture Beh;

