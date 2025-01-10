library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dddd is
  port(
    value : in unsigned(5 downto 0);    
    tensdigit : out std_logic_vector(6 downto 0);    
    onesdigit : out std_logic_vector(6 downto 0)
  );
end dddd;

architecture sim of dddd is

component sevenseg is
  port(
	  S : in unsigned(3 downto 0);
	  segments : out std_logic_vector(6 downto 0)
  );
end component;
    signal highbcd : unsigned(5 downto 0);
    signal lowbcd  : unsigned(3 downto 0);
begin

lowbcd  <= value mod 4d"10";
highbcd <= value / 5d"10";
tens : sevenseg port map (S => highbcd(3 downto 0),segments => tensdigit);
ones : sevenseg port map (S => lowbcd,segments => onesdigit);

end;

