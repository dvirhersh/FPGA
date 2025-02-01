----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2025 07:55:55 PM
-- Design Name: 
-- Module Name: reset_bridge_tb - Behavioral
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

entity reset_bridge_tb is
--  Port ( );
end reset_bridge_tb;

architecture Behavioral of reset_bridge_tb is

    component reset_bridge
        port(
           clk_dst : in STD_LOGIC;
           rst_in  : in STD_LOGIC;
           rst_out : out STD_LOGIC
        );
    end component;

    signal clk_dst : STD_LOGIC := '0';
    signal rst_in  : STD_LOGIC := '0';
    signal rst_out : STD_LOGIC := '0';

    constant clock_period : time := 101 ns;

begin

    rst_in <= '1', '0' after clock_period, '1' after clock_period*2;
    clk_dst <= not clk_dst after 5 ns;

uut: reset_bridge port map(
    clk_dst => clk_dst,
    rst_in  => rst_in,
    rst_out => rst_out
    );

end Behavioral;
