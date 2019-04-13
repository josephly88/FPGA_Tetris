----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2019 09:22:08 PM
-- Design Name: 
-- Module Name: BlockGenerator - Behavioral
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
use ieee.math_real.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BlockGenerator is
  Port (
    state : buffer  std_logic;
    blk   : out std_logic_vector(2 downto 0)
   );
end BlockGenerator;

architecture Behavioral of BlockGenerator is
    signal rand_num : integer := 0;
begin
    process(state)
        variable seed1, seed2: positive;               -- seed values for random generator
        variable rand: real;   -- random real-number value in range 0 to 1.0  
        variable range_of_rand : real := 7.0;    -- the range of random values created will be 0 to +1000.
    begin
        if state = '1' then
            uniform(seed1, seed2, rand);   -- generate random number
            rand_num <= integer(rand*range_of_rand);  -- rescale to 0..1000, convert integer part 
            blk <= std_logic_vector (to_unsigned(rand_num,3));
            state <= '0';
        end if;
    end process;
end Behavioral;
