-- vhdl-linter-disable not-declared type-resolved
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2025 04:19:00 PM
-- Design Name: 
-- Module Name: counter_for_rom_address - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_for_rom_address is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end counter_for_rom_address;

architecture Behavioral of counter_for_rom_address is

    component blk_mem_gen_0
        port(
            clka  : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
        );
    end component;

    signal count_to_addra : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '1');
    signal dout_sig       : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin

    process (CLK) begin
        if rising_edge (CLK) then
            if RST = '1' then
                count_to_addra <= (others => '1');
            else
                count_to_addra <= count_to_addra + 1;
            end if;
        end if;
    end process;
    
    uut : blk_mem_gen_0
        port map (
        clka  => CLK,
        addra => count_to_addra,
        douta => dout_sig
        );

DOUT <= dout_sig;

end Behavioral;
