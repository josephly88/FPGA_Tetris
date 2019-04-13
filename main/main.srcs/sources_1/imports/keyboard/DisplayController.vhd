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
			  DispVal : in  STD_LOGIC_VECTOR (4 downto 0);
			  --controls the display digits
			  led     : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end DisplayController;

architecture Behavioral of DisplayController is
begin

	 with DispVal select
		led <="11110000" when "00000", --0
              "00000001" when "00001", --1
              "00000010" when "00010", --2
              "00000011" when "00011", --3
              "00000100" when "00100", --4
              "00000101" when "00101", --5
              "00000110" when "00110", --6
              "00000111" when "00111", --7
              "00001000" when "01000", --8
              "00001001" when "01001", --9
              "00001010" when "01010", --A
              "00001011" when "01011", --B
              "00001100" when "01100", --C
              "00001101" when "01101", --D
              "00001110" when "01110", --E
              "00001111" when "01111", --F
              "00000000" when others;
	
end Behavioral;

