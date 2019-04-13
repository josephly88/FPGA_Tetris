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
        red,green,blue : out std_logic_vector(3 downto 0) ;
        JA             : inout std_logic_vector(7 downto 0);
        led            : out std_logic_vector(7 downto 0)
        );
end main;

architecture Behavioral of main is
    
    signal myboard : board;
    signal key     : std_logic_vector(4 downto 0);
    
--From display.vhd
component display is
    port(
        clk100MHz      : in  std_logic;
        hsync,vsync    : out std_logic;
        red,green,blue : out std_logic_vector(3 downto 0);
        myboard        : in  board
    );
end component;

component PmodKYPD is
    port(
        clk : in  STD_LOGIC;
        JA : inout  STD_LOGIC_VECTOR (7 downto 0); -- PmodKYPD is designed to be connected to JA
        key : buffer STD_LOGIC_VECTOR (4 downto 0)
    );
end component;

component DisplayController is
	Port (
                  DispVal : in  STD_LOGIC_VECTOR (4 downto 0);
                  led     : out STD_LOGIC_VECTOR (7 downto 0)
         );
	end component;

component move is
      port(
            clk100MHz  : in std_logic;
            myboard : buffer board;
            key     : buffer std_logic_vector(3 downto 0)
        );
end component;
    
begin

--Display
PRINT: display port map (clk100MHz => clk100MHz,
            hsync => hsync,
            vsync => vsync,
            red => red,
            green => green,
            blue => blue,
            myboard => myboard);
    
KEYPAD: PmodKYPD port map(
            clk => clk100MHz,
            JA => JA,
            key => key
            );                  

C1: DisplayController port map (DispVal=>key, led=>led);

MOV: move port map(
            clk100MHz  => clk100MHz,
            myboard => myboard
);


end Behavioral;
