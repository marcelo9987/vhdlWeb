library IEEE;
use IEEE.std_logic_1164.all;

entity funinabox is
    port
    (
        a       : in    std_logic;
        b       : in    std_logic;
        result  : out   std_logic_vector(3 downto 0)
    );
end funinabox;

architecture structural of funinabox is
    component thing1 is
        port
        (
            s : in  std_logic;
            t : in  std_logic;
            y : out std_logic_vector(3 downto 0)
        );
    end component thing1;
    
    component thing2 is
        port
        (
            e : in std_logic_vector(3 downto 0);
            f : in std_logic;
            g : out std_logic_vector(3 downto 0)
        );
    end component thing2;

    signal y_s : std_logic_vector(3 downto 0);

begin
    t1 : thing1 port map(s=>a,t=>b,y=>y_s);
    t2 : thing2 port map(e=>y_s,f=>a,g=>result);
end architecture structural;
    