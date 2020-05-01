----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2020 11:43:32 AM
-- Design Name: 
-- Module Name: ALUTEST - Behavioral
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
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUTEST is
--  Port ( );
end ALUTEST;

architecture Behavioral of ALUTEST is

component ALU is
 Port ( clk : in std_logic;
        opcode : in std_logic_vector(4 downto 0);
        immed : in std_logic_vector(23 downto 0);
        SrcAin : in std_logic_vector(23 downto 0);
        SrcAout: out std_logic_vector(23 downto 0);
        SrcBin : in std_logic_vector(23 downto 0);
        SrcBout: out std_logic_vector(23 downto 0));
end component;

--inputs 
signal clk: STD_LOGIC;
signal opcode:std_logic_vector(4 downto 0);
signal immed: std_logic_vector(23 downto 0);
signal SrcAin:std_logic_vector(23 downto 0);
signal SrcBin:std_logic_vector(23 downto 0);

--outputs
signal SrcAout:std_logic_vector(23 downto 0);
signal SrcBout:std_logic_vector(23 downto 0);

begin
uut: ALU PORT MAP ( 
    clk => clk,
    opcode => opcode,
    immed => immed,
    SrcAin => SrcAin,
    SrcBin => SrcBin,
    SrcAout => SrcAout,
    SrcBout => SrcBin
    );
    
CLK_PROCESS: Process
begin    

    clk <='0';
    wait for 10 ns; 
    clk <='1';
    srcAin<=x"000101";
    SrcBin<=x"000010";
    opcode<="10000"; --should be adding
    wait for 10 ns;
    ASSERT (srcAout = x"000111") -- if false issues report string
    REPORT "Test 2 failed"
    Severity Note;
    
end process;
end behavioral;