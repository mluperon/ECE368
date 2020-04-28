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
		IMMED 		: in STD_LOGIC_VECTOR(23 downto 0)
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
Port ( clk : in std_logic;
       RA_addr : in std_logic_vector(2 downto 0);
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
signal RA_data_in : std_logic_vector(23 downto 0);
signal RA_enable : std_logic;
--signal ALU_OUT : std_logic_vector(23 downto 0);
TYPE State_type IS (reset, fetch, execute, store);
	SIGNAL State : State_Type;   
begin
process(subclk)
begin
    if(subclk'event and subclk = '1' and clk='1') then
        case state is
            when reset =>
                RA_enable<= '0';
                state <= fetch;
            when fetch =>
                state <= execute;
            when execute=>
                state <= store;
                Ra_data_in <= SrcAout;
            when store=>
                RA_enable <= '1';
        end case;
    end if;
end process;
C1: ALU port map(   CLK=>subCLK,
                    opcode => opcode,
                    immed => immed,
                    srcAin => srcAin,
                    srcAout => srcAout,
                    srcBin => srcBin,
                    srcBout => srcBout
                    --ALU_out => ALU_out
                );
C2: GeneralPurposeReg port map( clk => subclk,
                                RA_addr => ADDR_A,
                                RB_addr => ADDR_B,
                                RA_enable => RA_enable, --write enable to RA set to 1 temporarily
                                RA_data_in => RA_data_in,
                                RA_out => Aout,
                                Rb_out => Bout);
C3: ASrc_Reg port map(  Aout => Aout,
                        ALU_A => srcAin);
C4: BSrc_Reg port map(  Bout => Bout,
                        ALU_B => srcBin);


ATEST <= srcAout(3 downto 0);
end Behavioral ;
