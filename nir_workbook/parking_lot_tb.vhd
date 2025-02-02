----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2025 04:49:30 PM
-- Design Name: 
-- Module Name: parking_lot_tb - Behavioral
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
use IEEE.std_logic_unsigned.all; -- vhdl-linter-disable-line not-declared

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parking_lot_tb is
--  Port ( );
end parking_lot_tb;

architecture Behavioral of parking_lot_tb is

    component parking_lot is
        Port ( CLOCK  : in STD_LOGIC;
               RESET  : in STD_LOGIC;
               CI     : in STD_LOGIC;
               CO     : in STD_LOGIC;
               PS     : out STD_LOGIC_VECTOR (9 downto 0);
               Enable : out STD_LOGIC);
    end component;

    signal CLOCK         : STD_LOGIC := '0';
    signal RESET         : STD_LOGIC := '0';
    signal CI            : STD_LOGIC := '0';
    signal CO            : STD_LOGIC := '0';
    signal PS_unused     : STD_LOGIC_VECTOR (9 downto 0);
    signal Enable_unused : STD_LOGIC;

    constant CLOCK_period : time := 9 ns;

begin

    uut: parking_lot port map (
        CLOCK  => CLOCK,
        RESET  => RESET,
        CI     => CI,
        CO     => CO,
        PS     => PS_unused,
        Enable => Enable_unused
    );

    CLOCK <= not CLOCK after 5 ns;
    RESET <= '1', '0' after clock_period * 10;

    stim_proc : process begin

        -- Test car entering
        for i in 1 to 5 loop
            CI <= '1';
            wait for CLOCK_period * 2;
            CI <= '0';
            wait for CLOCK_period * 5;
        end loop;

        -- Test car leaving (fiction situation)
        for i in 1 to 10 loop
            CO <= '1';
            wait for CLOCK_period * 2;
            CO <= '0';
            wait for CLOCK_period * 5;
        end loop;

        -- Test overflow condition
        for i in 1 to 1005 loop
            CI <= '1';
            wait for CLOCK_period * 2;
            CI <= '0';
            wait for CLOCK_period * 2;
        end loop;

        -- Test car leaving when full
        CO <= '1';
        wait for CLOCK_period * 2;
        CO <= '0';
        wait for CLOCK_period * 5;

        -- End simulation
        wait;
    end process;

end Behavioral;
