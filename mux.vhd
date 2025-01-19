----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/19/2025 02:16:47 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port ( IN1 : in STD_LOGIC;
           IN2 : in STD_LOGIC;
           IN3 : in STD_LOGIC;
           IN4 : in STD_LOGIC;
           Selector : in STD_LOGIC_VECTOR (1 downto 0);
           RES : out STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin

process (Selector,IN1,IN2,IN3,IN4)
begin
   case Selector is
      when "00" => RES <= IN1;
      when "01" => RES <= IN2;
      when "10" => RES <= IN3;
      when "11" => RES <= IN4;
      when others => RES <= IN1;
   end case;
end process;

end Behavioral;
