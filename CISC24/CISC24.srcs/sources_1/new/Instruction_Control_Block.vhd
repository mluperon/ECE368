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
        clk: in STD_LOGIC;
        reset: in STD_LOGIC;
        opcode: out STD_LOGIC_VECTOR(4 downto 0);
        ADDR_A   : out STD_LOGIC_VECTOR(2 downto 0);
		ADDR_B   : out STD_LOGIC_VECTOR(2 downto 0);
		AM_A		: out STD_LOGIC_VECTOR(1 downto 0);
		AM_B		: out STD_LOGIC_VECTOR(1 downto 0);
		IMM_OOP	: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_TOP	: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_MEM  : out STD_LOGIC_VECTOR(23 downto 0);
		IMM 		: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_BRN  : out STD_LOGIC_VECTOR(23 downto 0);
		MSK		: out STD_LOGIC_VECTOR(3  downto 0)
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
component Instruction_Decoder is
Port (  clk: in STD_LOGIC;
        opcode: out STD_LOGIC_VECTOR(4 downto 0);
        ADDR_A   : out STD_LOGIC_VECTOR(2 downto 0);
		ADDR_B   : out STD_LOGIC_VECTOR(2 downto 0);
		AM_A		: out STD_LOGIC_VECTOR(1 downto 0);
		AM_B		: out STD_LOGIC_VECTOR(1 downto 0);
		IMM_OOP	: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_TOP	: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_MEM  : out STD_LOGIC_VECTOR(23 downto 0);
		IMM 		: out STD_LOGIC_VECTOR(23 downto 0);
		IMM_BRN  : out STD_LOGIC_VECTOR(23 downto 0);
		MSK		: out STD_LOGIC_VECTOR(3  downto 0);
        InstructionIN: in STD_LOGIC_VECTOR(23 downto 0));
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
C4: Instruction_Decoder port map(   clk => clk,
                                    opcode => opcode,
                                    instructionin =>   instructionOUT,
                                    ADDR_A => ADDR_A,
                                    ADDR_B => ADDR_B,
                                    AM_A => AM_A,
                                    AM_B => AM_B,
                                    IMM_OOP => IMM_OOP,
                                    IMM_TOP => IMM_TOP,
                                    IMM_MEM => IMM_MEM
                                    );
                                  
end Behavioral;
