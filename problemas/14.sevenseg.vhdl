library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sevenseg is
  port(
	  S : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end sevenseg;

architecture synth of sevenseg is
begin
-- A
  with to_integer(S) select segments(6) <=
    '0' when (0)|2|3|5|6|7|8|9,
    '1' when others;
    
-- B
    with to_integer(S) select segments(5) <=
    '0' when (0)|1|2|3|4|7|8|9,
    '1' when others;
    
-- C
    with to_integer(S) select segments(4) <=
    '0' when (0)|1|3|4|5|6|7|8|9,
    '1' when others;
    
-- D
    with to_integer(S) select segments(3) <=
    '0' when (0)|2|3|5|6|8,
    '1' when others;

-- E
    with to_integer(S) select segments(2) <=
    '0' when (0)|2|6|8,
    '1' when others;
    
-- F
    with to_integer(S) select segments(1) <=
    '0' when (0)|4|5|6|8|9,
    '1' when others;
    
-- G
    with to_integer(S) select segments(0) <=
    '0' when 2|3|4|5|6|8|9,
    '1' when others;
end;

