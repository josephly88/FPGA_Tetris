library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity move is
    Port ( clk1Hz  : in std_logic;
           myboard : buffer board;
           key     : buffer std_logic_vector(3 downto 0)
    );
end move;

architecture Behavioral of move is
    signal pulse : integer := 0;
    signal x : integer := 0;
    signal y : integer := 5;
    
begin
    process(clk1Hz)         
    begin
        if rising_edge(clk1Hz) then
            if(pulse = 0 and (myboard(x)(y)) = '0') then
                (myboard(x)(y)) <= '1';
                 pulse <= pulse + 1;
            elsif(pulse < 20  and (myboard(x+1)(y)) = '0' and (myboard(x)(y)) = '1') then          
                (myboard(x+1)(y)) <= '1';
                (myboard(x)(y)) <= '0';
                x <= pulse;
                pulse <= pulse + 1;
            else
                pulse <= 0;
                x <= 0;
            end if;
        end if;
    end process;
end Behavioral;
