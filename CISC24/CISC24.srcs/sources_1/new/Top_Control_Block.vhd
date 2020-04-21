----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2020 02:13:18 PM
-- Design Name: 
-- Module Name: Control_Block - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  control block for CSC 24 Architecture
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity Control_Block is
  Port (
  -- Inputs 
  CLK : in STD_LOGIC;
  RESET: in STD_LOGIC;
  FLAGS: in STD_LOGIC_VECTOR(3 downto 0); --carry and state flags
  CODE: in STD_LOGIC_VECTOR(4 downto 0) -- Input signal for the opcode
  );
end Control_Block;

architecture Behavioral of Control_Block is

begin


end Behavioral;