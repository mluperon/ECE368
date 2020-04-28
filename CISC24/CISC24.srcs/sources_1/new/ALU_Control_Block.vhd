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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Control_Block is
Port (  clk : in std_logic;
        subclk : in STD_LOGIC;
        opcode: in STD_LOGIC_VECTOR(4 downto 0);
        ADDR_A   : in STD_LOGIC_VECTOR(2 downto 0);
		ADDR_B   : in STD_LOGIC_VECTOR(2 downto 0);
		ATEST : out STD_LOGIC_VECTOR(3 downto 0);
--		AM_A		: in STD_LOGIC_VECTOR(1 downto 0);
--		AM_B		: in STD_LOGIC_VECTOR(1 downto 0);
--		IMM_OOP	: in STD_LOGIC_VECTOR(23 downto 0);
--		IMM_TOP	: in STD_LOGIC_VECTOR(23 downto 0);
--		IMM_MEM  : in STD_LOGIC_VECTOR(23 downto 0);
		IMMED 		: in STD_LOGIC_VECTOR(23 downto 0)
--		IMM_BRN  : in STD_LOGIC_VECTOR(23 downto 0);
--		MSK		: in STD_LOGIC_VECTOR(3  downto 0)
);
end ALU_Control_Block;

architecture Behavioral of ALU_Control_Block is
component ALU is
 Port ( clk : in std_logic;
        opcode : in std_logic_vector(4 downto 0);
        immed : in std_logic_vector(23 downto 0);
        SrcAin : in std_logic_vector(23 downto 0);
        SrcAout: out std_logic_vector(23 downto 0);
        SrcBin : in std_logic_vector(23 downto 0);
        SrcBout: out std_logic_vector(23 downto 0)
        --ALU_OUT : in std_logic_vector(23 downto 0)
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
          ALU_A : out std_logic_vector(23 downto 0)  
        );
end component ;
component BSrc_Reg is
 Port ( 
          Bout : in std_logic_vector(23 downto 0);
          ALU_B : out std_logic_vector(23 downto 0)  
        );
end component ;
component GeneralPurposeReg is
Port ( RA_addr : in std_logic_vector(2 downto 0);
       RB_addr : in std_logic_vector(2 downto 0);
       RA_enable : in std_logic;
       RA_data_in : in std_logic_vector(23 downto 0);
       RA_out : out std_logic_vector (23 downto 0);
       Rb_out: out std_logic_vector (23 downto 0)
        );
end component;
signal Aout : std_logic_vector(23 downto 0);
signal Bout : std_logic_vector(23 downto 0);
signal SrcAin : std_logic_vector(23 downto 0);
signal SrcAout: std_logic_vector(23 downto 0);
signal SrcBin : std_logic_vector(23 downto 0);
signal SrcBout: std_logic_vector(23 downto 0);
signal RA_enable : std_logic;
signal Timer: std_logic_vector(9 downto 0);
--signal ALU_OUT : std_logic_vector(23 downto 0);

begin
process(subclk)
begin
    if (subclk'event and subclk = '1' and clk ='1')then
        timer <= timer + '1';
    end if;
    if(clk'event and clk = '0') then
        timer <= "0000000000";
    end if;
end process;
C1: ALU port map(   CLK=>CLK,
                    opcode => opcode,
                    immed => immed,
                    srcAin => srcAin,
                    srcAout => srcAout,
                    srcBin => srcBin,
                    srcBout => srcBout
                    --ALU_out => ALU_out
                );
C2: GeneralPurposeReg port map( RA_addr => ADDR_A,
                                RB_addr => ADDR_B,
                                RA_enable => RA_enable, --write enable to RA set to 1 temporarily
                                RA_data_in => srcAout,
                                RA_out => Aout,
                                Rb_out => Bout);
C3: ASrc_Reg port map(  Aout => Aout,
                        ALU_A => srcAin);
C4: BSrc_Reg port map(  Bout => Bout,
                        ALU_B => srcBin);
process(SRCAOUT)
begin
if (SRCAIN /= SRCAOUT) then
    RA_enable <= '1' ;
end if;
end process;
process(Timer(5))
begin
if(Timer(5)'event and Timer(5) = '1')then
    RA_enable <= '0';
end if;
end process;

ATEST <= srcAout(3 downto 0);
end Behavioral ;
