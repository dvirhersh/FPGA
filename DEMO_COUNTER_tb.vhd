----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/19/2025 03:41:54 PM
-- Design Name: 
-- Module Name: DEMO_COUNTER_tb - Behavioral
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

entity DEMO_COUNTER_tb is
--  Port ( );
end DEMO_COUNTER_tb;

architecture Behavioral of DEMO_COUNTER_tb is

    component DEMO_COUNTER
        port(
           CLOCK   : in STD_LOGIC;
           RESET   : in STD_LOGIC;
           CE      : in STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (9 downto 0)
            );
    end component ;

    signal CLOCK   : std_logic := '0';
    signal RESET   : std_logic := '0';
    signal CE      : std_logic := '0';
    signal COUNTER : std_logic_vector (9 downto 0) := (others => '0');
    
    constant clock_period : time := 10 ns;

begin

    uut: DEMO_COUNTER port map (
        CLOCK   => CLOCK,
        RESET   => RESET,
        CE      => CE,
        COUNTER => COUNTER
    );

    -- reset generation
    RESET <= '1', '0' after clock_period * 10;
    
    -- clock generation
    CLOCK <= not CLOCK after 5 ns;
    
    CE <= '1';

end Behavioral;
