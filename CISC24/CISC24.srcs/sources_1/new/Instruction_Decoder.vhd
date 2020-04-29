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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal Instruction : std_logic_vector(23 downto 0);
signal Mode : std_logic_vector(1 downto 0);
begin
Instruction <= InstructionIN;
--with Instruction(23 downto 19) select mode <=
--    "00" when "00000", -- HALT
--    "00" when "00100", -- CLR
--    "00" when "00101", -- INC
--    "00" when "00110", -- DEC
--    "00" when "00111", -- NEG
--    "00" when "01000", -- SLL
--    "00" when "01001", -- SRL
--    "01" when "01010", -- MVS
--    "00" when "01011", -- (mem) MVMI 
--    "00" when "01100", -- (mem) MSM
--    "00" when "01101", -- (mem) MMS
--    "01" when "10000", -- ADD
--    "01" when "10001", -- SUB
--    "01" when "10010", -- MUL
--    "01" when "10011", -- DIV
--    "01" when "10100", -- AND
--    "01" when "10101", -- OR
--    "01" when "10110", -- XOR
--    "01" when "10111", -- ADDI
--    "00" when "11000", -- SUBI
--    "00" when others;  
process (CLK)
    begin			
        if (CLK'event and CLK='1') then	
			ADDR_A   <= Instruction(16 downto 14);							-- SRC_A Address
			AM_A     <= Instruction(18 downto 17);			
			ADDR_B   <= Instruction(11 downto 9);								-- SRC_B Address
			AM_B     <= Instruction(13 downto 12);
			IMM_OOP  <= "0000000000" & instruction(13 downto 0);			-- IMMEDIATE
			IMM_TOP  <= "000000000000000" & Instruction(8 downto 0);
			IMM_MEM  <= "00000000000000"  & Instruction(18 downto 9);
			IMM_BRN  <= "000000000" & Instruction(14 downto 0);		
			IMM      <= "00000" & Instruction(18 downto 0);
			OPCODE   <= Instruction(23 downto 19);							-- OPERAND
			MSK		 <= Instruction(18 downto 15);							-- MASK
									
        end if;
    end process;    
end Behavioral;
