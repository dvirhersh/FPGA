----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2025 02:19:25 PM
-- Design Name: 
-- Module Name: simple_dual_port_ram_tb - Behavioral
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

entity simple_dual_port_ram_tb is
--  Port ( );
end simple_dual_port_ram_tb;

architecture Behavioral of simple_dual_port_ram_tb is

    COMPONENT blk_mem_gen_1
      PORT (
        clka  : IN STD_LOGIC; -- 100MHz
        wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        dina  : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        clkb  : IN STD_LOGIC; -- 100MHz
        addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) 
      );
    END COMPONENT;

    --in
    signal clka      :  STD_LOGIC := '0';
    signal wea       :  STD_LOGIC_VECTOR(0 DOWNTO 0) := (others => '0');
    signal addra_sig :  STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '1');
    signal dina      :  STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
    signal clkb      :  STD_LOGIC := '0';
    signal addrb     :  STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    --out
    signal doutb     : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');

begin

    clka <= not (clka) after 5 ns;
    clkb <= not (clkb) after 5 ns;

     process (clka) begin 
        if rising_edge (clka) then
            wea(0) <= not addra_sig(8);
            addra_sig <= addra_sig + 1;
            dina <= '0' & addra_sig(7 downto 0) & '0'; -- multiply by 2
    --        wait for 10 ns;
        end if;
     end process;

    uut : blk_mem_gen_1
        port map (
            clka  => clka,
            wea   => wea,
            addra => addra_sig(7 downto 0),
            dina  => dina,
            clkb  => clkb,
            addrb => addra_sig(7 downto 0),
            doutb => doutb
            );

end Behavioral;
