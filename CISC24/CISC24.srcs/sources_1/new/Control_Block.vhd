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
  RESET : in STD_LOGIC;
  OPCODE : out STD_LOGIC_VECTOR(4 downto 0)
   );
end Instruction_Control_Block;

architecture Behavioral of Instruction_Control_Block is

component Instruction_REG is
port(
       InstructionIN : in std_Logic_vector(23 downto 0);
       InstructionOUT : out std_Logic_vector(23 downto 0));
end component;
component Program_Counter is
Port ( clk : in std_logic;
       PCount : out std_logic_vector(8 downto 0);
       reset : in std_logic);
end component;              
component Instruction_Memory is
port (
 pc: in std_logic_vector(8 downto 0);
 instruction: out  std_logic_vector(23 downto 0)
);
end component;
signal InstructionOUT : std_logic_vector(23 downto 0);
signal InstructionIN : std_logic_vector(23 downto 0);
signal PC : std_logic_vector(8 downto 0);

begin

C1: Instruction_REG port map(   InstructionIn => InstructionIn,
                                InstructionOut => InstructionOut);
C2: Instruction_Memory port map(   PC => PC,
                                   Instruction => InstructionIN);
C3: Program_Counter port map(   CLK => CLK,
                                PCount => PC,
                                reset => reset);
                                

end Behavioral;
