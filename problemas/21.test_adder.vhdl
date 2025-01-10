--  Testbench for 4-bit adder
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

entity adder_test is
-- No ports, since this is a testbench
end adder_test;

architecture test of adder_test is

component adder is
  port(
	  a : in unsigned(3 downto 0);
	  b : in unsigned(3 downto 0);
	  sum : out unsigned(3 downto 0)
  );
end component;
    signal salida_s         : unsigned(3 downto 0); 
    signal a_s, b_s,amasb   : unsigned(3 downto 0); 
begin

    sumador : adder port map(a=>a_s,b=>b_s,sum=>salida_s);

    pruebas: process 
    begin 
        for var1 in 0 to 15 loop
            for var2 in 0 to 15 loop
                a_s     <= to_unsigned(var1,4);
                b_s     <= to_unsigned(var2,4);
                
                amasb <= to_unsigned(var1 + var2, 4);
                wait for 10 ns;
                
                assert (salida_s = amasb)
                report "Test fallido | failed"
                severity error;
                
            end loop;
        end loop;
        
        wait;
    end process pruebas;

end test;
