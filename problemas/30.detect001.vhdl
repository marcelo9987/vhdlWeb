
/**
    * Secuencia a detectar 0-0-1
    * Se detecta el cambio en cada ciclo (flanco de subida).
    * Automata de Moore
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity detect001 is
  port(
    clk : in std_logic;
    input : in std_logic;
    result : out std_logic
  );
end detect001;

architecture synth of detect001 is
    type State is (NADA,UNCERO,DOSCEROS,UNO);
    signal estado_actual,estado_siguiente : State;
begin

    reloj: process(clk)
    begin
        if (rising_edge(clk)) then
            estado_actual <= estado_siguiente;
        end if;
    end process;

    combinacional: process(estado_actual,input)
    begin

        if (estado_actual=UNCERO)
        then
            result <= '0';
            if (input='0')
            then
                estado_siguiente <= DOSCEROS;
            else
                estado_siguiente <= estado_actual;
            end if;
        elsif (estado_actual=DOSCEROS)
        then
            result <= '0';
            if (input='1')
            then
                estado_siguiente <= UNO;
            else
                estado_siguiente <= estado_actual;
            end if;
        elsif (estado_actual=UNO)
        then 
            result<='1';
            if(input='0')
            then
                estado_siguiente <= UNCERO;
            else
                estado_siguiente <= NADA;
            end if;
        elsif (estado_actual=NADA)
        then
            result <= '0';
            if (input='0')
            then 
                estado_siguiente <= UNCERO;
            else
                estado_siguiente <= NADA;
            end if;
        else 
            estado_siguiente<=NADA;
        end if;
    end process combinacional;
end architecture synth;        
