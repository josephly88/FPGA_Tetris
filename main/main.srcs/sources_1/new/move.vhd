library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.my_types_pkg.all;

entity move is
    Port ( clk1Hz  : in std_logic;
           myboard : buffer board
    );
end move;

architecture Behavioral of move is

constant count: integer := 0;
begin

    process(clk1Hz, myboard)
    variable i : integer range 0 to 20; 
    variable j : integer range 0 to 10; 
    begin
        
            myboard(0)(5) <= '0';
            myboard(1)(5) <= '1';
--            loop
--                exit when i = 20;
--                loop
--                    exit when j = 10;
--                    if myboard(i)(j) = '1' then
--                        myboard(i)(j) <= '0';
--                        if(i < 19) then
--                            myboard(i+1)(j) <= '1';
--                        end if;
--                        exit;
--                    end if;
--                end loop;
--            end loop;
    end process;
end Behavioral;
