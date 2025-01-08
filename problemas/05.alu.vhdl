/**
* Fill in the architecture to build a simple ALU. The operands are 4 bits each.
* The operation should be performed according to the following table:
* S1  S0  Operation
* 0   0   Bitwise AND
* 0   1   Bitwise OR
* 1   0   Add
* 1   1   Subtract (A-B)
*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
          a : in unsigned(3 downto 0);
          b : in unsigned(3 downto 0);
          s : in std_logic_vector(1 downto 0);
          y : out unsigned(3 downto 0)
            
        );
end alu;

architecture synth of alu is 
begin
    y <=
             a and  b when s = "00"
        else a or   b when s = "01"
        else a +    b when s = "10"
        else a -    b when s = "11";
end architecture synth;

