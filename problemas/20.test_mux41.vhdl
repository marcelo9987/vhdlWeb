--  Testbench for 4:1 multiplexer
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity mux41_test is
-- No ports, since this is a testbench
end mux41_test;

architecture test of mux41_test is

component mux41 is
  port(
	  d : in std_logic_vector(3 downto 0); -- Data port
	  s : in std_logic_vector(1 downto 0); -- Select
	  y : out std_logic -- Result
  );
end component;
    signal d_s : std_logic_vector(3 downto 0);
    signal s_s : std_logic_vector(1 downto 0);
    signal y_s : std_logic;
begin
    

    multiplexor: mux41 port map(d=>d_s,s=>s_s,y=>y_s);
    
    pruebas:process
    begin
        d_s <= "1011";
        
        s_s <= "00";
        wait for 10 ns;
        assert y_s='1'
        report "failed"
        severity error;
        
        
        s_s <= "01";
        wait for 10 ns;
        assert y_s='1'
        report "failed"
        severity error;

        
        s_s <= "10";
        wait for 10 ns;
        assert y_s='0'
        report "failed"
        severity error;

        
        
        s_s <= "11";
        wait for 10 ns;
        assert y_s='1'
        report "failed"
        severity error;
        
    end process pruebas;

end test;

