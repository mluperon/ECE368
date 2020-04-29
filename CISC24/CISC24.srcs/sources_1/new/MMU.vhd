----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2020 01:13:48 PM
-- Design Name: 
-- Module Name: MMU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: State machine designed for CISC 24 Architecture
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MMU is
<<<<<<< HEAD
  Port (clk        : in Std_logic;   
        enable     : in std_logic; 	
        reset      : in std_logic;
        address_in : in std_logic_vector(15 downto 0); --input addresses for memory fetch
        address_out: out std_logic_vector(7 downto 0); --output memory address
        data_in    : in std_logic_vector(7 downto 0); 
  --ram_address: in std_logic_vector(19 downto 0);
  --IMM_OOP	 : in STD_LOGIC_VECTOR(23 downto 0);
  --IMM_TOP	 : in STD_LOGIC_VECTOR(23 downto 0);
  --IMM_MEM    : in STD_LOGIC_VECTOR(23 downto 0);
  --IMM_BRN    : in STD_LOGIC_VECTOR(23 downto 0);
  --MSK		 : in STD_LOGIC_VECTOR(3  downto 0);

=======
  Port (clk        :  in Std_logic;   
        enable     : in std_logic; 	
        reset      : in std_logic;
        address_in : in std_logic_vector(9 downto 0); --input addresses for memory fetch
        address_out: out std_logic_vector(9 downto 0);
        data_in    : in std_logic_vector(23 downto 0); --output memory address
        data_out    : out std_logic_vector(23 downto 0)); 
>>>>>>> adeead18032e46e211b4606e8a7abee04a541fa7
end MMU;

architecture Behavioral of MMU is
<<<<<<< HEAD
component 

=======
component Memory is
    Port ( clk : in std_logic;
           we : in std_logic;
           address: in std_logic_vector(9 downto 0);
           datain : in std_logic_vector(23 downto 0);
           dataout : out std_logic_vector(23 downto 0) 
            );
end component;
>>>>>>> adeead18032e46e211b4606e8a7abee04a541fa7
begin

C1: Memory port map (clk => clk,
                     we => enable,
                     address => address_in,
                     datain => data_in,
                     dataout => data_out
                     );
end Behavioral;
