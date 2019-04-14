----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2019 09:30:01 PM
-- Design Name: 
-- Module Name: block_decode - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity falling_block_decode is
      Port ( blocks : in std_logic_vector(2 downto 0);
             nextR1, nextC1, nextR2, nextC2, nextR3, nextC3, nextR4, nextC4 : out integer
      );
end falling_block_decode;

architecture Behavioral of falling_block_decode is

begin
    process(blocks)
    begin
        if(blocks = "000") then
            nextR1 <= 1;
            nextC1 <= 4;
            nextR2 <= 1;
            nextC2 <= 5;
            nextR3 <= 2;
            nextC3 <= 4;
            nextR4 <= 2;
            nextC4 <= 5;
        else
            nextR1 <= -1;
            nextC1 <= -1;
            nextR2 <= -1;
            nextC2 <= -1;
            nextR3 <= -1;
            nextC3 <= -1;
            nextR4 <= -1;
            nextC4 <= -1;
        end if;
    end process;
end Behavioral;
