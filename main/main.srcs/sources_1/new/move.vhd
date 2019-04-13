library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity move is
    Port ( clk100MHz  : in std_logic;
           myboard : buffer board;
           key     : buffer std_logic_vector(3 downto 0)
    );
end move;

architecture Behavioral of move is
    -- clk1Hz
    signal clk1Hz  : std_logic := '0';
    signal counter : integer := 0;
    
begin
    --1Hz clock
    process(clk100MHz)
    begin
        if rising_edge(clk100MHz) then
            if(counter = 100000000/2 - 1) then
                clk1Hz <= not clk1Hz;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
   
    process(clk1Hz)
    begin
        if rising_edge(clk1Hz) then
        
        
        end if;
    end process;
    
end Behavioral;
