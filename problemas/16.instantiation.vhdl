/**
* Complete the architecture below to implement a 4-input AND gate, by using a 4-input NAND gate which has already been created. 
* (Yes, this would be easier with the behavioral modeling you already know, but the point here is to practice instantiating submodules!)
*
* Entidad: and4
* Puertos:
*     a : in  std_logic
*	  b : in  std_logic
*	  c : in  std_logic
*	  y : out std_logic
*
* You'll need to use the following component declaration:
* 
* component nand4
*  port(
*      a : in std_logic;
*      b : in std_logic;
*      c : in std_logic;
*      y : out std_logic
*  );
* end component;
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity and4 is
    port
    (
        a : in std_logic;
	    b : in std_logic;
	    c : in std_logic;
	    y : out std_logic
    );
end entity;

architecture Structural of and4 is
    component nand4 is 
        port
        (
            a, b, c : in  std_logic;
            y       : out std_logic
        );
    end component;
    signal y_s : std_logic;
begin
    puerta1: nand4 port map(a=>a,b=>b,c=>c,y=>y_s);
    y <= not(y_s);
end architecture Structural; 


