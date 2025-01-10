/**
* A powerful construct for specifying combinational logic is when/else:
*
* OUTPUT <= VALUE when (CONDITION) else OTHER_VALUE;
* 
* Complete the architecture below to build a 8-bit 2:1 multiplexer.
* The inputs A and B are each 8 bits, and select line S is a single bit.
* When S is low, all 8 bits of A should be connected to the output Y; 
* when S is high, the 8 bits of B should go to the output.
*/


library IEEE;
use IEEE.std_logic_1164.all;

entity mux21 is
  port(
	  a : in std_logic_vector(7 downto 0);
	  b : in std_logic_vector(7 downto 0);
	  s : in std_logic;
	  y : out std_logic_vector(7 downto 0)
  );
end mux21;

architecture synth of mux21 is
begin
    y <= 
                a when s='0'
        else    b;
         
end architecture synth;
