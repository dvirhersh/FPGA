----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2025 03:41:24 PM
-- Design Name: 
-- Module Name: HIST_UNIT_TB - Behavioral
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
use IEEE.std_logic_unsigned.ALL;  -- vhdl-linter-disable-line not-declared

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HIST_UNIT_TB is
--  Port ( );
end HIST_UNIT_TB;

architecture Behavioral of HIST_UNIT_TB is

    component HIST_UNIT
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           HIST_READY   : out STD_LOGIC;
           HIST_VALUE   : out STD_LOGIC_VECTOR (7 downto 0);
           VALUE_AMOUNT : out STD_LOGIC_VECTOR (9 downto 0));
    end component; 

    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    signal HIST_READY   : STD_LOGIC;
    signal HIST_VALUE   : STD_LOGIC_VECTOR (7 downto 0);
    signal VALUE_AMOUNT : STD_LOGIC_VECTOR (9 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;

begin

    -- RST and CLK generation
    RST <= '1', '0' after CLK_PERIOD * 10;
    CLK <= not CLK after 5 ns; -- 100 MHz

    uut: HIST_UNIT port map (
        CLK => CLK,
        RST => RST,
        HIST_READY => HIST_READY,
        HIST_VALUE => HIST_VALUE,
        VALUE_AMOUNT => VALUE_AMOUNT
        );

end Behavioral;
