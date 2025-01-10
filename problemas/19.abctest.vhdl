--  Testbench for AB+!BC
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity abc_test is
-- No ports, since this is a testbench
end abc_test;

architecture test of abc_test is

component abc is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  c : in std_logic;
	  y : out std_logic
  );
end component;
signal a,b,c,y : std_logic;
begin
    r: abc port map(a=>a,b=>b,c=>c,y=>y);
    
    test:process
    begin
    a<='0';b<='0';c<='0';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='0';b<='0';c<='1';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='0';b<='1';c<='0';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='0';b<='1';c<='1';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='1';b<='0';c<='0';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='1';b<='0';c<='1';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='1';b<='1';c<='0';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
        
    a<='1';b<='1';c<='1';
    wait for 1 ns;
    assert y = ((a and b) or (not(b)and c))
        report "failed";
    
    end process;

end test;

