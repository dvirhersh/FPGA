----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2025 04:18:52 PM
-- Design Name: 
-- Module Name: parking_lot - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parking_lot is
    Port ( CLOCK  : in STD_LOGIC;
           RESET  : in STD_LOGIC;
           CI     : in STD_LOGIC;
           CO     : in STD_LOGIC;
           PS     : out STD_LOGIC_VECTOR (9 downto 0); -- parking space, max = 1000
           Enable : out STD_LOGIC);
end parking_lot;

architecture Behavioral of parking_lot is
    
    constant max_capacity : integer := 1000;
    
    -- for sync
    signal CI_in_meta, CO_in_meta, CI_in_sync, CO_in_sync : std_logic := '0';

    -- counter
    signal previous_ci, previous_co : std_logic := '0';
    signal counter                  : STD_LOGIC_VECTOR (9 downto 0):= (others => '0');

begin

    -- Synchronize inputs
    process (CLOCK) begin
        if rising_edge (CLOCK) then
            CI_in_meta <= CI;
            CI_in_sync <= CI_in_meta;
            CO_in_meta <= CO;
            CO_in_sync <= CO_in_meta;
        end if;
    end process;

    -- counter
    process (CLOCK) begin
        if rising_edge (CLOCK) then
            if RESET = '1' then
                counter     <= (others => '0');
                previous_co <= '0';
                previous_ci <= '0';
            else
                previous_ci <= CI_in_sync;
                previous_co <= CO_in_sync;
                
                -- Car entering - using rising edge detector on CI
                if CI_in_sync = '1' and previous_ci = '0' and counter < max_capacity then
                    counter <= counter + 1;
                end if;
                
                -- Car exiting (rising edge on CO)
                if CO_in_sync = '1' and previous_co = '0' and counter > 0 then
                    counter <= counter - 1;
                end if;
            end if;
        end if;
    end process;
    
    PS <= counter;
    Enable <= '1' when counter < max_capacity else '0';

end Behavioral;
