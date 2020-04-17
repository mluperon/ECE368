----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2020 12:31:44 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
Port (  opcode: out STD_LOGIC_VECTOR(4 downto 0);
        InstructionIN: in STD_LOGIC_VECTOR(23 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal Instruction : std_logic_vector(23 downto 0);
signal Mode : std_logic_vector(1 downto 0);
begin
Instruction <= InstructionIN;
opcode <= Instruction(23 downto 19);
with Instruction(23 downto 19) select mode <=
    "00" when "00000",
    "00" when "00100",
    "00" when "00101",
    "00" when "00110",
    "00" when "00111",
    "00" when "01000",
    "00" when "01001",
    "01" when "01010",
    "00" when "01011",--mem
    "00" when "01100",--mem
    "00" when "01101",--mem
    "01" when "10000",
    "01" when "10001",
    "01" when "10010",
    "01" when "10011",
    "01" when "10100",
    "01" when "10110",
    "01" when "10111",
    "00" when "11000",
    "00" when others;
    
end Behavioral;
