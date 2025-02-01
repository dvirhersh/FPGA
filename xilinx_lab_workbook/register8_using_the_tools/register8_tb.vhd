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
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- vhdl-linter-disable-line not-declared

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

    component register8 is
        Port ( clock : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               reset : in STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR (7 downto 0);
               enable : in STD_LOGIC
               );
    end component;

    signal CLK_sig  : std_logic                     := '0';
    signal DIN_sig  : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal RST_sig  : std_logic                     := '0';
    signal DOUT_sig : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal CE_sig   : std_logic                     := '0';

    constant clock_period : time := 10 ns;

begin

    dut: register8 port map ( 
                clock   => CLK_sig,
                data_in  => DIN_sig,
                reset    => RST_sig,
                data_out => DOUT_sig,
                enable   => CE_sig
               );

    -- reset generation
    RST_sig <= '1', '0' after clock_period * 10;
    
    -- clock generation
    CLK_sig <= not CLK_sig after 5 ns;
    
    CE_sig <= '1';
    
    DIN_sig <= "10010101" after clock_period * 15, "11010001" after clock_period * 20;
    

end Behavioral;
