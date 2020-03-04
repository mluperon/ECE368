library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;

entity Memory is
    Port ( clk : in std_logic;
           we : in std_logic;
           address: in std_logic_vector;
           datain : in std_logic_vector;
           dataout : out std_logic_vector 
            );
end Memory;

architecture Behavioral of Memory is

type memory is array (0 to (512-1)) of STD_LOGIC_vector(23 downto 0);
signal RAM  : memory;
signal read_address : std_logic_vector(address'range);    
begin

RamProc: process(clk) is

  begin
    if (clk'event and clk = '1') then
      if (we = '1') then
        ram(to_integer(unsigned(address))) <= datain;
      end if;
      read_address <= address;
    end if;
  end process RamProc;

  dataout <= ram(to_integer(unsigned(read_address)));


end Behavioral;
