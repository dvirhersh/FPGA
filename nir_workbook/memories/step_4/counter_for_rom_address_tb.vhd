-- vhdl-linter-disable type-resolved
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2025 04:54:38 PM
-- Design Name: 
-- Module Name: counter_for_rom_address_tb - Behavioral
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

entity counter_for_rom_address_tb is
--  Port ( );
end counter_for_rom_address_tb;

architecture Behavioral of counter_for_rom_address_tb is
    component counter_for_rom_address
        port ( CLK : in std_logic;
               RST : in std_logic;
               DOUT : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    --in
    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    --out
    signal DOUT_unused : STD_LOGIC_VECTOR (7 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;
    
begin

    uut: counter_for_rom_address port map (
        CLK => CLK,
        RST => RST,
        DOUT => DOUT_unused
    );
    
    -- RST and CLK generation
    RST <= '1', '0' after CLK_PERIOD * 10;
    CLK <= not CLK after 5 ns;

end Behavioral;
