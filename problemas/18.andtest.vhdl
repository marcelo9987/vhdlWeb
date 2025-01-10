--  Testbench for AND gate
library IEEE;
use IEEE.std_logic_1164.all;
use std.textio.all;

entity and_test is
-- No ports, since this is a testbench
    end and_test;

architecture test of and_test is

    component andgate is
        port(
                a : in std_logic;
                b : in std_logic;
                y : out std_logic

            );
    end component;

    signal  a_s,b_s: std_logic;
    signal y_s:std_logic;

begin

    test3: andgate port map(a=>a_s,b=>b_s,y=>y_s);
    assert y_s=(a_s and b_s)
        report "failed"
        severity failure;
                        
end test;

