----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2020 01:13:48 PM
-- Design Name: 
-- Module Name: MMU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: State machine designed for CISC 24 Architecture
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

entity MMU is
  Port ( 
  clk:  in Std_logic;
  address_in:  in std_logic_vector(19 downto 0);
  ram_address: out std_logic_vector(19 downto 0);
  ram_data:    in std_logic_vector(7 downto 0); 
  enable:      in std_logic; 
  reset:       in std_logic);
end MMU;


architecture Behavioral of MMU is

begin


end Behavioral;
