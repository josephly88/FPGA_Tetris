library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity falling is
  Port (
             clk100MHz  : in std_logic;
             myboard : buffer board
   );
end falling;

architecture Behavioral of falling is
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
    variable nextR1 : integer := 1;
    variable nextC1 : integer := 6;
    variable nextR2 : integer := 2;
    variable nextC2 : integer := 6;
    variable nextR3 : integer := 2;
    variable nextC3 : integer := 7;
    variable nextR4 : integer := 3;
    variable nextC4 : integer := 7;
                
    begin
    
        if rising_edge(clk1Hz) then
            if(nextR1 <= 20 and nextR2 <= 20 and nextR3 <= 20 and nextR4 <= 20) then
                --move downward
                for i in 0 to 20 loop
                    for j in 0 to 9 loop
                        if (myboard(i)(j)) = "10" then
                            myboard(i)(j) <= "00";
                        else
                            myboard(i)(j) <= myboard(i)(j);
                        end if;
                    end loop;
                end loop;
                
                for i in 0 to 20 loop
                    for j in 0 to 9 loop
                        if (i = nextR1 and j = nextC1) 
                            or (i = nextR2 and j = nextC2)
                            or (i = nextR3 and j = nextC3)
                            or (i = nextR4 and j = nextC4) then
                            myboard(i)(j) <= "10";
                        end if;
                    end loop;
                end loop;
                
                nextR1 := nextR1 + 1;
                nextC1 := nextC1;
                nextR2 := nextR2 + 1;
                nextC2 := nextC2;
                nextR3 := nextR3 + 1;
                nextC3 := nextC3;
                nextR4 := nextR4 + 1;
                nextC4 := nextC4; 
            else
                for i in 0 to 20 loop
                    for j in 0 to 9 loop
                        if (i = nextR1 - 1 and j = nextC1) 
                            or (i = nextR2 - 1 and j = nextC2)
                            or (i = nextR3 - 1 and j = nextC3)
                            or (i = nextR4 - 1 and j = nextC4) then
                            myboard(i)(j) <= "01";
                        else
                            myboard(i)(j) <= myboard(i)(j);
                        end if;
                    end loop;
                end loop;
            end if;
        end if;
    end process;

end Behavioral;
