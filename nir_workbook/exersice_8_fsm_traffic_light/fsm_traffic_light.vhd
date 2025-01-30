----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2025 07:12:44 PM
-- Design Name: 
-- Module Name: fsm_traffic_light - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_traffic_light is
    Port ( RST      : in STD_LOGIC;
           CLK      : in STD_LOGIC;
           RED_W    : out STD_LOGIC;
           GREEN_W  : out STD_LOGIC;
           RED_C    : out STD_LOGIC;
           ORANGE_C : out STD_LOGIC;
           GREEN_C  : out STD_LOGIC);
end fsm_traffic_light;

architecture Behavioral of fsm_traffic_light is

    type state_type is (START, WALK, STOP_WALK, PRE_DRIVE, DRIVE, STOP_DRIVE);
    signal state : state_type := START;
    
    -- till d'2400 / 0x960
    signal count : std_logic_vector (11 downto 0) := (others => '0');  
    
    -- Constants for better readability
    constant MAX_COUNT      : integer := 2400;
    constant START_TIME     : integer := 100;
    constant WALK_TIME      : integer := 1000;
    constant STOP_WALK_TIME : integer := 1100;
    constant PRE_DRIVE_TIME : integer := 1200;
    constant DRIVE_TIME     : integer := 2200;
begin

    -- Counter process
    process (CLK) begin
        if rising_edge (CLK) then
            if RST = '1' then
                count <= (others => '0');
            elsif count = MAX_COUNT then
                count <= (others => '0');
            else 
                count <= count + 1;
            end if;
        end if;
    end process;

    -- FSM process
    process (CLK) begin
        if rising_edge (CLK) then
            if RST = '1' then
                RED_W    <= '1';
                GREEN_W  <= '0';
                RED_C    <= '1';
                ORANGE_C <= '0' ;
                GREEN_C  <= '0';
                state    <= START;
            else
                case state is
                    when START =>
                        RED_W    <= '1';
                        GREEN_W  <= '0';
                        RED_C    <= '1';
                        ORANGE_C <= '0' ;
                        GREEN_C  <= '0';
                        if count = START_TIME then
                            state <= WALK;
                        end if; 

                    when WALK =>
                        RED_W    <= '0';
                        GREEN_W  <= '1';
                        RED_C    <= '1';
                        ORANGE_C <= '0' ;
                        GREEN_C  <= '0';
                        if count = WALK_TIME then
                            state <= STOP_WALK;
                        end if; 
                        
                    when STOP_WALK =>
                        RED_W    <= '1';
                        GREEN_W  <= '0';
                        RED_C    <= '1';
                        ORANGE_C <= '0' ;
                        GREEN_C  <= '0';
                        if count = STOP_WALK_TIME then
                            state <= PRE_DRIVE;
                        end if; 
                        
                    when PRE_DRIVE =>
                        RED_W    <= '1';
                        GREEN_W  <= '0';
                        RED_C    <= '0';
                        ORANGE_C <= '1' ;
                        GREEN_C  <= '0';
                        if count = PRE_DRIVE_TIME then
                            state <= DRIVE;
                        end if; 
                        
                    when DRIVE =>
                        RED_W    <= '1';
                        GREEN_W  <= '0';
                        RED_C    <= '0';
                        ORANGE_C <= '0' ;
                        GREEN_C  <= '1';
                        if count = DRIVE_TIME then
                            state <= STOP_DRIVE;
                        end if; 
                        
                    when STOP_DRIVE =>
                        RED_W    <= '1';
                        GREEN_W  <= '0';
                        RED_C    <= '1';
                        ORANGE_C <= '0' ;
                        GREEN_C  <= '0';
                        if count = MAX_COUNT then
                            state <= START;
                        end if; 
                end case;
            end if;
        end if;
    end process;

end Behavioral;
