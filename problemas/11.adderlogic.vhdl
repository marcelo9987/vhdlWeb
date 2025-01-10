/**
* Implement a 3-bit adder without using the addition operator,
* by writing boolean assignments for each bit. A and B are 3-bit inputs;
* the result should be a 4-bit output (so there should be no overflow.)
*
* Use intermediate signals for the carry bits.
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity adderlogic is
    port(
            a : in std_logic_vector(2 downto 0);
            b : in std_logic_vector(2 downto 0);
            sum : out std_logic_vector(3 downto 0)

        );
end adderlogic;

architecture synth of adderlogic is
    signal bit0carry,bit1carry,bit2carry : std_logic;
    signal bit0,bit1,bit2                : std_logic;
begin
    bit0        <= a(0) xor b(0);
    bit0carry   <= a(0) and b(0);

    bit1        <= (a(1) xor b(1)) xor bit0carry;
    bit1carry   <= (a(1) and b(1)) or (bit0carry and (a(1) or b(1)));

    bit2        <= (a(2) xor b(2)) xor bit1carry;
    bit2carry   <= (a(2) and b(2)) or (bit1carry and (a(2) or b(2)));

    sum <= bit2carry & bit2 & bit1 & bit0;
end architecture synth;


