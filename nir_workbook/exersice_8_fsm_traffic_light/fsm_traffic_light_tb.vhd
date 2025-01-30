----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2025 07:49:16 PM
-- Design Name: 
-- Module Name: fsm_traffic_light_tb - Behavioral
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

entity fsm_traffic_light_tb is
--  Port ( );
end fsm_traffic_light_tb;

architecture Behavioral of fsm_traffic_light_tb is
    
    -- Component declaration for uut
    component fsm_traffic_light
    Port ( RST      : in STD_LOGIC;
           CLK      : in STD_LOGIC;
           RED_W    : out STD_LOGIC;
           GREEN_W  : out STD_LOGIC;
           RED_C    : out STD_LOGIC;
           ORANGE_C : out STD_LOGIC;
           GREEN_C  : out STD_LOGIC
        );
    end component;
    
    -- Signals
    signal RST      : STD_LOGIC := '0';
    signal CLK      : STD_LOGIC := '0';
    signal RED_W    : STD_LOGIC := '0';
    signal GREEN_W  : STD_LOGIC := '0';
    signal RED_C    : STD_LOGIC := '0';
    signal ORANGE_C : STD_LOGIC := '0';
    signal GREEN_C  : STD_LOGIC := '0';
    
    constant clock_period : time := 10 ns;

begin

    uut : fsm_traffic_light port map(
        RST      => RST,
        CLK      => CLK,
        RED_W    => RED_W,
        GREEN_W  => GREEN_W,
        RED_C    => RED_C,
        ORANGE_C => ORANGE_C,
        GREEN_C  => GREEN_C
    );
    
    -- reset generation
    RST <= '1', '0' after clock_period * 10;
    
    -- clock generation
    CLK <= not CLK after 5 ns;

end Behavioral;
