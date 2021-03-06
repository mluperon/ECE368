----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2020 01:23:18 PM
-- Design Name: 
-- Module Name: Instruction_REG - Behavioral
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

entity Instruction_REG is
Port ( InstructionIN : in std_Logic_vector(23 downto 0);
       InstructionOUT : out std_Logic_vector(23 downto 0));
end Instruction_REG;

architecture Behavioral of Instruction_REG is
signal IREG : std_logic_vector(23 downto 0);
begin
IREG <= InstructionIN;
InstructionOUT <= IREG;


end Behavioral;
