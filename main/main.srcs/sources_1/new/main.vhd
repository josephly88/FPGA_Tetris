----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2019 09:22:07 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package my_types_pkg is
  --create 2d array for board
    type board is array (0 to 19) of std_logic_vector(0 to 9);
end package;

library work;
use work.my_types_pkg.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity main is
  Port (
        --For display
        clk100MHz      : in  std_logic;
        hsync,vsync    : out std_logic;
        red,green,blue : out std_logic_vector(3 downto 0) 
        );
end main;

architecture Behavioral of main is
    
    signal myboard : board;

--From display.vhd
component vga_test is
    port(
        clk100MHz      : in  std_logic;
        hsync,vsync    : out std_logic;
        red,green,blue : out std_logic_vector(3 downto 0);
        myboard        : in  board
    );
end component;
    
begin

    --Test
    process(myboard)
    begin
        for i in 0 to 19 loop
            for j in 0 to 9 loop
                if (i + j) mod 2 = 0 then
                    myboard(i)(j) <= '1';
                else 
                    myboard(i)(j) <= '0';
                end if;
            end loop;
        end loop;
    end process;
    
    --Display
    DISPLAY: vga_test port map (clk100MHz => clk100MHz,
                      hsync => hsync,
                      vsync => vsync,
                      red => red,
                      green => green,
                      blue => blue,
                      myboard => myboard);
                      
    

end Behavioral;
