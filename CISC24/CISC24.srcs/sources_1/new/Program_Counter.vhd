----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2020 01:15:10 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Counter is
Port ( clk : in std_logic;
       PCount : out std_logic_vector(8 downto 0);
       reset : in std_logic);
end Program_Counter;

architecture Behavioral of Program_Counter is
signal PC : std_logic_vector(8 downto 0);
begin
process(clk,reset)
    begin
        if(falling_edge(clk) and reset = '0') then
            PC <= PC + '1';
        end if;
        if(reset = '1') then
            PC <= "000000000";
        end if;
end process;
PCount <= PC;
end Behavioral;
