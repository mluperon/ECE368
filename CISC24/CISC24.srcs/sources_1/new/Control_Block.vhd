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

entity Instruction_Control_Block is
  Port (
  -- Inputs 
  CLK : in STD_LOGIC;
--  Instruction : in STD_LOGIC_VECTOR(23 downto 0);
  FLAGS: in STD_LOGIC_VECTOR(3 downto 0);
  OPCODE: out STD_LOGIC_VECTOR(4 downto 0)
   );
end Instruction_Control_Block;

architecture Behavioral of Instruction_Control_Block is

component IREG is
port(
       InstructionIN : in std_Logic_vector(23 downto 0);
       InstructionOUT : out std_Logic_vector(23 downto 0));
end component;
              

signal InstructionOUT : std_logic_vector(23 downto 0);
signal InstructionIN : std_logic_vector(23 downto 0);

begin

C1: IREG port map(InstructionIn => InstructionIn,
                  InstructionOut => InstructionOut);

end Behavioral;
