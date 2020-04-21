library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BSrc_Reg is
 Port ( 
          Bout : in std_logic_vector(23 downto 0);
          ALU_B : out std_logic_vector(23 downto 0)  
        );
end BSrc_Reg ;

architecture Behavioral of BSrc_Reg  is

signal REG : std_logic_vector(23 downto 0);

begin

REG <= Bout;
ALU_select <= REG;

end behavioral;