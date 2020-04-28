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
   X"B80002",  --need to change these
   X"B84001",
   X"60400f",
   X"69400f",
   X"800200",
   X"890a00",
   X"a00200",
   X"a80200",
   X"800200",
   X"914000",
   X"50CA00",
   X"000000",
   X"B80002",
   X"B80002",
   X"B80002",
   X"B80002"
  );
begin

 rom_addr <= pc(3 downto 0);
 instruction <= rom_data(to_integer(unsigned(rom_addr)));

end Behavioral;