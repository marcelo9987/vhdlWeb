/**
* A bus is a set of signals which are grouped together conceptually (and often physically). 
* One way to represent a bus is with std_logic_vector, which is somewhat similar to an array
* in software programming languages.
*
* We can declare a 3-bit input bus called votes with
* 
* votes : in std_logic_vector(2 downto 0)
*
* With this declaration, you can use votes(0) to refer to bit 0 of votes, votes(1) for bit 1,
* and votes(2) for bit 2. The (2 downto 0) part specifies that this is a 3-bit bus where votes(2) is the MSB and votes(0) is the LSB.
*
* Complete the architecture to build a majority encoder: 
* the output y is 1 if the majority (i.e., at least two) of the input bits are 1, and 0 otherwise.
*/

/*
* Tabla de verdad:
*   votes(2) votes(1) votes(0)  | y
*       0       0       0       | 0  (no   1s)
*       0       0       1       | 0  (un   1 )
*       0       1       0       | 0  (un   1 )
*       0       1       1       | 1  (dos  1s)
*       1       0       0       | 0  (un   1 )
*       1       0       1       | 1  (dos  1s)
*       1       1       0       | 1  (dos  1s)
*       1       1       1       | 1  (tres 1s)
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity majority is
  port(
	  votes : in std_logic_vector(2 downto 0);
	  y : out std_logic
  );
end majority;

architecture synth of majority is
begin
  y <= (votes(0) and votes(1)) or (votes(1) and votes(2)) or (votes(0) and votes(2));
end;

