----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2020 03:50:17 PM
-- Design Name: 
-- Module Name: ALU_Control_Block - Behavioral
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

entity ALU_Control_Block is
Port ( clk : in std_logic );
end ALU_Control_Block;

architecture Behavioral of ALU_Control_Block is
component ALU is
 Port ( clk : in std_logic;
        opcode : in std_logic_vector(4 downto 0);
        immed : in std_logic_vector(23 downto 0);
        SrcAin : in std_logic_vector(23 downto 0);
        SrcAout: out std_logic_vector(23 downto 0);
        SrcBin : in std_logic_vector(23 downto 0);
        SrcBout: out std_logic_vector(23 downto 0);
        ALU_OUT : in std_logic_vector(23 downto 0)
        );
end component;
component ALU_Data_Reg is
 Port ( 
          ALU_IN : in std_logic_vector(23 downto 0);
          Data : out std_logic_vector(23 downto 0)  
        );
end component ;
component ASrc_Reg is
 Port ( 
          Aout : in std_logic_vector(23 downto 0);
          ALU_select : out std_logic_vector(23 downto 0)  
        );
end component ;
component BSrc_Reg is
 Port ( 
          Bout : in std_logic_vector(23 downto 0);
          ALU_select : out std_logic_vector(23 downto 0)  
        );
end component ;

signal opcode : std_logic_vector(4 downto 0);
signal immed : std_logic_vector(23 downto 0);
signal SrcAin : std_logic_vector(23 downto 0);
signal SrcAout: std_logic_vector(23 downto 0);
signal SrcBin : std_logic_vector(23 downto 0);
signal SrcBout: std_logic_vector(23 downto 0);
signal ALU_OUT : std_logic_vector(23 downto 0);

begin
c1: ALU port map(   CLK=>CLK,
                    opcode => opcode,
                    immed => immed,
                    srcAin => srcAin,
                    srcAout => srcAout,
                    srcBin => srcBin,
                    srcBout => srcBout,
                    ALU_out => ALU_out
                );

end Behavioral;
