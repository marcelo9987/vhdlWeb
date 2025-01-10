/**
* Complete the architecture below to build an 8-bit saturating adder: 
*    add the two operands, but if the sum is greater than what can be represented by the 8-bit output,
*    let it saturate (take its maximum value) rather than rolling over. 
*
* For example, 200 + 100 should equal 255, not 44.
*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity saturatingadd is
    port(
          a : in unsigned(7 downto 0);
          b : in unsigned(7 downto 0);
          result : out unsigned(7 downto 0)
            
        );
end saturatingadd;

architecture synth of saturatingadd is
begin
    result <= 
                    a+b when ( 255 - a )>=b 
              else  to_unsigned(255,8);
end architecture synth;
