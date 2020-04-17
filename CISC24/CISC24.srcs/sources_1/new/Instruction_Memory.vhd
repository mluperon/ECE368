----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2020 11:44:25 AM
-- Design Name: 
-- Module Name: Instruction_Memory - Behavioral
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
USE IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Memory is
port (
 pc: in std_logic_vector(8 downto 0);
 instruction: out  std_logic_vector(23 downto 0)
);
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
signal rom_addr: std_logic_vector(3 downto 0);

 type ROM_type is array (0 to  15) of std_logic_vector(23 downto 0);
 constant rom_data: ROM_type:=(
   "1000000110000000",  --need to change these
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000"
  );
begin

 rom_addr <= pc(4 downto 1);
 instruction <= rom_data(to_integer(unsigned(rom_addr))) when pc < x"0020" else x"0000";

end Behavioral;