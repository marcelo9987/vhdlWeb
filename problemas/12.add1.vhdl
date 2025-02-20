/**
* Complete the architecture below to add 1 to the 8-bit input. It should overflow to 0 after it reaches the maximum value.
*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add1 is
    port(
          operand : in unsigned(7 downto 0);
          result : out unsigned(7 downto 0)
            
        );
end add1;

architecture synth of add1 is
begin
      result <= operand + 1;
      end;

