----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2020 04:52:23 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: ram information adopted from http://amir-shenodua.blogspot.com/2012/06/simple-memory-management-with-vhdl.html

-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( address : in STD_LOGIC_VECTOR (19 downto 0);
           data : out STD_LOGIC_VECTOR (7 downto 0)
           WriteEnable: in STD_LOGIC);
end RAM;

architecture Behavioral of RAM is

type memory_array is array (0 to 30) of std_logic_vector(7 downto 0);
constant characters: memory_array := (

    "00000001",
    "00000010",
    "00000011",
    "00000100",
    "00000101",
    "00000110",
    "00000111",
    "00001000",
    "00001001",
    "00001010",
    "00001011",
    "00001100",
    "00001101",
    "00001110",
    "00001111",
    "00010000",
    "00010001",
    "00010010",
    "00010011",
    "00010100",
    "00010101",
    "00010110",
    "00010111",
    "00011000",
    "00011001",
    "00011010",
    "00011011",
    "00011100",
    "00011101",
    "00011110",
    "00011111" );

begin

process (address )
begin
        data <= characters(conv_integer(address));
end process;

end behavioral;

