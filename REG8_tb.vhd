----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2025 11:09:20 AM
-- Design Name: 
-- Module Name: REG8_tb - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG8_tb is
--  Port ( );
end REG8_tb;

architecture Behavioral of REG8_tb is

    component REG8 is
        Port ( CLK : in STD_LOGIC;
               DIN : in STD_LOGIC_VECTOR (7 downto 0);
               RST : in STD_LOGIC;
               DOUT : out STD_LOGIC_VECTOR (7 downto 0);
               CE : in STD_LOGIC
               );
    end component;

    signal CLK_sig  : std_logic                     := '0';
    signal DIN_sig  : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal RST_sig  : std_logic                     := '0';
    signal DOUT_sig : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal CE_sig   : std_logic                     := '0';

    constant clock_period : time := 10 ns;

begin

    dut: REG8 port map ( 
                CLK  => CLK_sig,
                DIN  => DIN_sig,
                RST  => RST_sig,
                DOUT => DOUT_sig,
                CE   => CE_sig
               );

    -- reset generation
    RST_sig <= '1', '0' after clock_period * 10;
    
    -- clock generation
    CLK_sig <= not CLK_sig after 5 ns;
    
    CE_sig <= '1';

end Behavioral;
