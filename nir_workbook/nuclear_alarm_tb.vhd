----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2025 03:37:25 PM
-- Design Name: 
-- Module Name: nuclear_alarm_tb - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nuclear_alarm_tb is
--  Port ( );
end nuclear_alarm_tb;

architecture Behavioral of nuclear_alarm_tb is

component nuclear_alarm
    port (CLOCK : in STD_LOGIC;
          RESET : in STD_LOGIC;
          RAD   : in STD_LOGIC;
          ALARM : out STD_LOGIC);
end component; 

-- in 
signal CLOCK : STD_LOGIC :='0';
signal RESET : STD_LOGIC :='0';
signal RAD   : STD_LOGIC :='0';
-- out
signal ALARM : STD_LOGIC :='0';

constant clock_period : time := 20 ns;

begin

uut: nuclear_alarm port map (
    CLOCK => CLOCK,
    RESET => RESET,
    RAD => RAD,
    ALARM => ALARM);
    
CLOCK <= not CLOCK after 10ns;
RESET <= '1', '0' after 10ns;

process

begin
    RAD <= '1';
    wait for 40us;
    RAD <= '0';
    wait for 60us;
    RAD <= '1';
    wait for 7us;
    RAD <= '0';
    wait for 93us;
    RAD <= '1';
    wait for 15us;
    RAD <= '0';
    wait for 85us;
end process;

end Behavioral;
