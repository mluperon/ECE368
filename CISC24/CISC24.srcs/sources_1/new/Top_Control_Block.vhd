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

entity Control_Block is
  Port (
  -- Inputs
  LED : out STD_LOGIC_VECTOR(15 downto 0);
  CLK : in STD_LOGIC;
  RESET: in STD_LOGIC
  );
end Control_Block;

architecture Structural of Control_Block is

component Instruction_Control_Block is
  Port (    PcTest: out STD_LOGIC_VECTOR(8 downto 0);
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
end component;
component ALU_Control_Block is
Port (  clk : in std_logic;
        subclk : in Std_logic;
        ATEST : out STD_LOGIC_VECTOR(3 downto 0);
        opcode: in STD_LOGIC_VECTOR(4 downto 0);
        ADDR_A   : in STD_LOGIC_VECTOR(2 downto 0);
		ADDR_B   : in STD_LOGIC_VECTOR(2 downto 0);
		IMMED 		: in STD_LOGIC_VECTOR(23 downto 0));
end component;
component MMU is
  Port (clk        :  in Std_logic;   
        enable     : in std_logic; 	
        reset      : in std_logic;
        address_in : in std_logic_vector(9 downto 0); --input addresses for memory fetch
        address_out: out std_logic_vector(9 downto 0);
        data_in    : in std_logic_vector(23 downto 0); --output memory address
        data_out    : out std_logic_vector(23 downto 0)); 
end component;

signal slow_clock: std_logic_vector(26 downto 0);
signal opcode : STD_LOGIC_VECTOR(4 downto 0);
signal ADDR_A : STD_LOGIC_VECTOR(2 downto 0);
signal ADDR_B : STD_LOGIC_VECTOR(2 downto 0);
signal IMMED : STD_LOGIC_VECTOR(23 downto 0);
signal AM_A	: STD_LOGIC_VECTOR(1 downto 0);
signal AM_B : STD_LOGIC_VECTOR(1 downto 0);
signal IMM_OOP	: STD_LOGIC_VECTOR(23 downto 0);
signal IMM_TOP	: STD_LOGIC_VECTOR(23 downto 0);
signal IMM_MEM : STD_LOGIC_VECTOR(23 downto 0);
signal IMM : STD_LOGIC_VECTOR(23 downto 0);
signal IMM_BRN : STD_LOGIC_VECTOR(23 downto 0);
signal MSK	: STD_LOGIC_VECTOR(3  downto 0);
signal enable : std_logic;
signal Address_in : STD_LOGIC_VECTOR(9 downto 0);
signal Address_out : STD_LOGIC_VECTOR(9 downto 0);
signal data_in : STD_LOGIC_VECTOR(23 downto 0);
signal data_out : STD_LOGIC_VECTOR(23 downto 0);

signal ATEST	: STD_LOGIC_VECTOR(3  downto 0); 

begin
Process(clk)        --use for clock scaler
begin
    if(clk'event and clk = '1')then
        slow_clock <= slow_clock + '1';
    end if;
end process;

A : Instruction_Control_Block port map( PcTest => LED(15 downto 7),
                                        clk => slow_clock(26),
                                        --clk => clk,
                                        reset => reset,
                                        opcode => opcode,
                                        ADDR_A => ADDR_A,
                                        ADDR_B => ADDR_B,
                                        AM_A => AM_A,
                                        AM_B => AM_B,
                                        IMM_OOP => IMM_OOP,
                                        IMM_TOP => IMM_TOP,
                                        IMM_MEM => IMM_MEM,
                                        IMM => IMM,
                                        IMM_BRN => IMM_BRN,
                                        MSK => MSK
);

B : ALU_Control_Block port map(clk => slow_clock(26),
                               subclk => clk,
                               --clk => clk,
                               opcode => opcode,
                               ADDR_A => ADDR_A,
                               ATEST => ATEST,
                               ADDR_B => ADDR_B,
                               IMMED =>IMMED
);
C: MMU port map(    clk => clk,
                    enable => enable,
                    reset=> reset,
                    address_in => Address_in,
                    address_out => Address_out,
                    data_in => data_in,
                    data_out => data_out);
                    
LED(3 downto 0) <= ATEST(3 downto 0);
end Structural;