library IEEE;
use IEEE.std_logic_1164.all;

entity gray2 is
  port(
	  clk   : in std_logic;
	  reset : in std_logic;
	  count : out std_logic_vector(1 downto 0)
  );
end gray2;

architecture synth of gray2 is
 type estado is (Q0,Q1,Q2,Q3);
 signal estado_actual,estado_siguiente : estado;
begin
  clk_p : process(clk,reset)
  begin
    if(reset)
    then
        estado_actual <= Q0;
    else
        if(rising_edge(clk))
        then
            estado_actual<= estado_siguiente;
        end if;
    end if;
  end process clk_p;
  
  process(estado_actual)
  begin
    case estado_actual is
    when Q0 =>
        count <= "00";
        estado_siguiente <= Q1;
    when Q1 =>
        count <= "01";
        estado_siguiente <= Q2;
    when Q2 =>
        count <= "11";
        estado_siguiente <= Q3;
    when Q3 =>
        count <= "10";
        estado_siguiente <= Q0;
    when others =>
        count <= "00";
        estado_siguiente <= Q0;
    end case;
  end process;
end;

