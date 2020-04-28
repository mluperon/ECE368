----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2020 04:48:33 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
 Port ( clk : in std_logic;
        opcode : in std_logic_vector(4 downto 0);
        immed : in std_logic_vector(23 downto 0);
        SrcAin : in std_logic_vector(23 downto 0);
        SrcAout: out std_logic_vector(23 downto 0);
        SrcBin : in std_logic_vector(23 downto 0);
        SrcBout: out std_logic_vector(23 downto 0)
        --ALU_OUT : in std_logic_vector(23 downto 0)
        );
end ALU;

architecture Behavioral of ALU is

begin

process(clk)
begin
if(clk'event and clk = '1' ) then
case (opcode) is
        when "00101" => SrcAout <= SrcAin + '1' ; --INC
        when "00110" => SrcAout <= SrcAin - '1' ; --DEC
        when "00111" => SrcAout <= '0'-SrcAin;  --NEG
        when "01000" => SrcAout <= std_logic_vector(shift_left(unsigned(SrcAin), to_integer(unsigned(immed)))); --SLL IMMED
        when "01001" => SrcAout <= std_logic_vector(shift_right(unsigned(SrcAin), to_integer(unsigned(immed)))); --SRL IMMED
        when "01010" => SrcBout <= SrcAin; --MVS
        --when "01011" =>     --MVMI
        --when "01100" =>     --MSM
        --when "01101" => SrcAout <=  --MMS
        when "10000" => SrcAout <= SrcAin + SrcBin; --ADD 
        when "10001" => SrcAout <= SrcAin - SrcBin; --SUB 
        --when "10010" => SrcAout <= std_logic_vector(signed(SrcAin) * signed(SrcBin)); --MUL 
        when "10011" => SrcAout <= std_logic_vector(signed(SrcAin) / signed(SrcBin)); --DIV 
        when "10100" => SrcAout <= srcAin AND srcBin; --and
        when "10101" => SrcAout <= srcAin OR srcBin; --or
        when "10110" => SrcAout <= srcAin XOR srcBin; --xor
        when "10111" => SrcAout <= SrcAin + immed; --ADD immed
        when "11000" => SrcAout <= SrcAin - immed; --SUB immed
        when others => SrcAout <= SrcAin;
end case;

end if;
end process;
end Behavioral;
