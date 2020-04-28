library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ASrc_Reg is
 Port ( 
          Aout : in std_logic_vector(23 downto 0);
          ALU_A : out std_logic_vector(23 downto 0)  
        );
end ASrc_Reg ;

architecture Behavioral of ASrc_Reg  is

signal REG : std_logic_vector(23 downto 0);

begin

REG <= Aout;
ALU_A <= REG;

end behavioral;