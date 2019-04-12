----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date: 13:28:41 08/18/2011 
--
-- Module Name:    DisplayController - Behavioral 
-- Project Name: 	 PmodKYPD
-- Target Devices: Nexys 3 
-- Tool versions: Xilinx ISE Design Suite 13.2
--
-- Description: 
-- This file defines a DisplayController that controls the seven segment display that works with 
-- the output of the Decoder
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DisplayController is
    Port ( 
			  --output from the Decoder
			  DispVal : in  STD_LOGIC_VECTOR (3 downto 0);
			  --controls the display digits
			  led     : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end DisplayController;

architecture Behavioral of DisplayController is
begin

	 with DispVal select
		led <="11110000" when "0000", --0
              "00000001" when "0001", --1
              "00000010" when "0010", --2
              "00000011" when "0011", --3
              "00000100" when "0100", --4
              "00000101" when "0101", --5
              "00000110" when "0110", --6
              "00000111" when "0111", --7
              "00001000" when "1000", --8
              "00001001" when "1001", --9
              "00001010" when "1010", --A
              "00001011" when "1011", --B
              "00001100" when "1100", --C
              "00001101" when "1101", --D
              "00001110" when "1110", --E
              "00001111" when "1111", --F
              "00000000" when others;
	
end Behavioral;

