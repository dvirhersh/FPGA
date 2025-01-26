----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2025 02:37:53 PM
-- Design Name: 
-- Module Name: nuclear_alarm - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nuclear_alarm is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           RAD : in STD_LOGIC;
           ALARM : out STD_LOGIC);
end nuclear_alarm;

architecture Behavioral of nuclear_alarm is

signal count : std_logic_vector (8 downto 0) := (others => '0');

begin

process (CLOCK) 
begin
    if rising_edge(CLOCK) then
        if (RESET = '1') or (RAD = '0') then  
            count <= (others => '0');
        elsif count < 500 then  
            count <= count + 1;
        else
            count <= count;
        end if;
     end if;
end process;

process (CLOCK)
begin
    if CLOCK = '1' and CLOCK'event then
        if RESET = '1' then 
            ALARM <= '0';
        elsif count = 500 then  
            ALARM <= '1';
        else 
            ALARM <= '0';
        end if;
    end if;
end process;

end Behavioral;
