----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2020 01:44:21 PM
-- Design Name: 
-- Module Name: Test - Behavioral
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

entity RAM_TB is
    Port ( 
        CLK: in STD_Logic);
end RAM_TB;

architecture Behavioral of RAM_TB is

component MEMORY
Port(
    --inputs 
    address: IN STD_LOGIC_VECTOR(9 downto 0);
    clk: in STD_LOGIC;
    WE: in STD_LOGIC;
    data_in: in STD_LOGIC_VECTOR(23 DOWNTO 0);
    --outputs
    data_out: out STD_LOGIC_VECTOR(23 DOWNTO 0));
end component;
    
--inputs 
signal address: STD_LOGIC_VECTOR(9 downto 0) :=  (others=>'0');
signal WE: std_logic:= '0';
signal data_in: STD_LOGIC_VECTOR( 23 downto 0);

--outputs
signal data_out: STD_LOGIC_VECTOR( 23 downto 0);

begin

uut: MEMORY PORT MAP (
    clk => clk,
    address => address,
    data_in => data_in,
    data_out => data_out,
    WE=> WE
    );
    
CLK_PROCESS: Process
begin
    WE<='1';
    address<="000000001";
    data_in<= x"000001";
    wait for 10 ns;
    WE<='0';
    ASSERT (data_out = x"000001") -- if false issues report string
    REPORT "Test 1 failed"
    SEVERITY NOTE;
    wait for 10 ns;
    WE<='1';
    address<="000000010";
    data_in<= x"000010";
    wait for 10 ns;
    WE<='0';
    ASSERT (data_out = x"000010") -- if false issues report string
    REPORT "Test 2 failed"
    SEVERITY NOTE;
    wait for 10 ns;
    WE<='1';
    address<="000000100";
    data_in<= x"000100";
    wait for 10 ns;
    WE<='0';
    ASSERT (data_out = x"000100") -- if false issues report string
    REPORT "Test 3 failed"
    SEVERITY NOTE;
    wait for 10 ns;
    
    end process;
end Behavioral;
