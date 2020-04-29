----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2020 02:40:45 PM
-- Design Name: 
-- Module Name: Instr_Decoder_2 - Behavioral
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

entity Instr_Decoder_2 is
    Port ( INST_CLK : in STD_LOGIC;
           Data_Inst : in STD_LOGIC;
           Enable : in STD_LOGIC;
           selA : out STD_LOGIC_VECTOR (2 downto 0);
           selB : out STD_LOGIC_VECTOR (2 downto 0);
           --selD : out STD_LOGIC_VECTOR (2 downto 0);
           dataIMM : out STD_LOGIC_VECTOR (15 downto 0);
           regDwe : out STD_LOGIC;
           aluop : out STD_LOGIC_VECTOR (4 downto 0));
end Instr_Decoder_2;

architecture Behavioral of Instr_Decoder_2 is

begin

    process(INST_CLK)
    begin
        if rising_edge(INST_CLK) and Enable = '1' then 
        selA <= Data_Inst(7 downto 5);
        selB <= Data_Inst(4 ownto 2); 
        dataIMM <= Data_Inst(7 downto 0) and Data_Inst(7 downto 0); 
        dataIMM <= Data_Inst(15 downto 12) & Data_Inst(8);
        
        case 
end Behavioral;
