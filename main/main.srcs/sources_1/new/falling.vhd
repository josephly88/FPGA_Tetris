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
             myboard : buffer board;
             blocks : in std_logic_vector(2 downto 0)
   );
end falling;

architecture Behavioral of falling is

    component falling_block_decode is
        Port ( blocks : in std_logic_vector(2 downto 0);
               nextR1, nextC1, nextR2, nextC2, nextR3, nextC3, nextR4, nextC4 : out integer
          );
    end component; 


    --1Hz clk
    signal clk1Hz  : std_logic := '0';
    signal counter : integer := 0;
    
    signal curR1, curC1, curR2, curC2, curR3, curC3, curR4, curC4 : integer := 88;
    
begin

DECODE_BLOCK: falling_block_decode port map(
    blocks=>blocks,
    nextR1=>curR1, nextC1=>curC1, nextR2=>curR2, nextC2=>curC2, 
    nextR3=>curR3, nextC3=>curC3, nextR4=>curR4, nextC4=>curC4
);

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
    variable nextR1 : integer := 88;
    variable nextC1 : integer := 88;
    variable nextR2 : integer := 88;
    variable nextC2 : integer := 88;
    variable nextR3 : integer := 88;
    variable nextC3 : integer := 88;
    variable nextR4 : integer := 88;
    variable nextC4 : integer := 88;
                
    begin

        if rising_edge(clk1Hz) then
            
            if(curR1 /= 88) then --curR1-4 has assigned value
            
                if(nextR1 = 88) then --if nextR1-4 hasn't assigned value
                    --update nextR1-4
                    nextR1 := curR1;
                    nextC1 := curC1;
                    nextR2 := curR2;
                    nextC2 := curC2;
                    nextR3 := curR3;
                    nextC3 := curC3;
                    nextR4 := curR4;
                    nextC4 := curC4;
                else
                    --nextR1-4 inside the board
                    if(nextR1 <= 20 and nextR2 <= 20 and nextR3 <= 20 and nextR4 <= 20) then
                        --move downward
                        
                        --remove the "10" element
                        for i in 0 to 20 loop
                            for j in 0 to 9 loop
                                if (myboard(i)(j)) = "10" then
                                    myboard(i)(j) <= "00";
                                else
                                    myboard(i)(j) <= myboard(i)(j);
                                end if;
                            end loop;
                        end loop;
                        
                        --fill the next element
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
                        
                        --update the next element
                        nextR1 := nextR1 + 1;
                        nextC1 := nextC1;
                        nextR2 := nextR2 + 1;
                        nextC2 := nextC2;
                        nextR3 := nextR3 + 1;
                        nextC3 := nextC3;
                        nextR4 := nextR4 + 1;
                        nextC4 := nextC4; 
                    else  --nextR1-4 out of board
                        --change the block state
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
                        
                        nextR1 := 88;
                        curR1 <= 88;
                        
                    end if;
                    
                end if;
            end if;
        end if;
    end process;

end Behavioral;
