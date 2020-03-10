library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Data_Reg is
 Port ( 
          ALU_IN : in std_logic_vector(23 downto 0);
          Data : out std_logic_vector(23 downto 0)  
        );
end ALU_Data_Reg ;

architecture Behavioral of ALU_Data_Reg  is

signal REG : std_logic_vector(23 downto 0);

begin

REG <= ALU_IN;
Data <= REG;

end behavioral;