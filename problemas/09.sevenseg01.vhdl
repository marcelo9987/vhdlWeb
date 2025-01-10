/**
* std_logic_vector makes it easy to compare and assign whole buses, which dramatically simplifies the work necessary* to specify combinational logic.
*
* For example, if value is a 4-bit bus, we could compare it with a constant:
* 
*   value = "1101"
*
* Similarly, if output is an 8-bit bus, we could set all the bits at once with
*
*   output <= "0001111"
*
* Note the use of double-quotes for bit-vector constants.
* A single bit uses single quotes, multiple bits use multiple quotes.
*
* Complete the architecture below to display the value of S using the digits 0 and 1 on a 7-segment display.
* The output should be a vector of bits corresponding to the LED segments, in the order "abcdefg". 
* Put the 1 on the right side of the display (using segments b and c).
*/

/*
     a
     _
   f| |b
     -
   e|g|c
     _
     d
     segments = "abcdefg"
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity sevenseg01 is
    port(
            S : in std_logic;
            segments : out std_logic_vector(6 downto 0)

        );
end sevenseg01;

architecture synth of sevenseg01 is
begin
    segments <= "0110000" when s='1' else "1111110" when s='0' else "1111111";
end architecture synth;

