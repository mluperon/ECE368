----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2020 10:19:04 AM
-- Design Name: 
-- Module Name: GeneralPurposeReg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GeneralPurposeReg is
Port ( clk : in std_logic;
       RA_addr : in std_logic_vector(2 downto 0);
       RB_addr : in std_logic_vector(2 downto 0);
       RA_enable : in std_logic;
       RA_data_in : in std_logic_vector(23 downto 0);
       RA_out : out std_logic_vector (23 downto 0);
       Rb_out: out std_logic_vector (23 downto 0)
        );
end GeneralPurposeReg;

architecture Behavioral of GeneralPurposeReg is
signal RA: std_logic_vector (23 downto 0);
signal RB: std_logic_vector (23 downto 0);
signal R0: std_logic_vector (23 downto 0);
signal R1: std_logic_vector (23 downto 0);
signal R2: std_logic_vector (23 downto 0);
signal R3: std_logic_vector (23 downto 0);
signal R4: std_logic_vector (23 downto 0);
signal R5: std_logic_vector (23 downto 0);
signal R6: std_logic_vector (23 downto 0);
signal R7: std_logic_vector (23 downto 0);
begin

RA_out<= RA;
RB_out<= RB;

process(clk) 
begin
if (clk'event and clk = '1')then
    if RA_enable = '0' then 
    
        case RA_addr is
            when "000"  => RA <= R0;
            when "001"  => RA <= R1;
            when "010"  => RA <= R2;
            when "011"  => RA <= R3;
            when "100"  => RA <= R4;
            when "101"  => RA <= R5;
            when "110"  => RA <= R6;
            when "111"  => RA <= R7;
        end case;
            
        case RB_addr is
            when "000"  => RB <= R0;
            when "001"  => RB <= R1;
            when "010"  => RB <= R2;
            when "011"  => RB <= R3;
            when "100"  => RB <= R4;
            when "101"  => RB <= R5;
            when "110"  => RB <= R6;
            when "111"  => RB <= R7;  
       end case;
              
    end if; 
    if RA_Enable = '1' then
        case RA_ADDR is
            when "000"  => R0 <= RA_DATA_IN;
            when "001"  => R1 <= RA_DATA_IN;
            when "010"  => R2 <= RA_DATA_IN;
            when "011"  => R3 <= RA_DATA_IN;
            when "100"  => R4 <= RA_DATA_IN;
            when "101"  => R5 <= RA_DATA_IN;
            when "110"  => R6 <= RA_DATA_IN;
            when "111"  => R7 <= RA_DATA_IN; 
       end case;
              
    end if; 
    end if;
end process;

end Behavioral;
