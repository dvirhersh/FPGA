----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2025 07:44:57 PM
-- Design Name: 
-- Module Name: tb_blk_mem_gen_1 - Behavioral
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

entity tb_blk_mem_gen_1 is
--  Port ( );
end tb_blk_mem_gen_1;

architecture Behavioral of tb_blk_mem_gen_1 is

component blk_mem_gen_1
        port(
            clka  : IN STD_LOGIC;
            ena   : IN STD_LOGIC;
            wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            dina  : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            clkb  : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
        );
    end component;

    --in
    signal clka      :  STD_LOGIC := '0';
    signal ena       :  STD_LOGIC := '0';
    signal wea       :  STD_LOGIC_VECTOR(0 DOWNTO 0) := (others => '0');
    signal addra_sig :  STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
    signal dina      :  STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
    signal clkb      :  STD_LOGIC := '0';
    signal addrb     :  STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    --out
    signal doutb : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');

begin

uut : blk_mem_gen_1
    port map (
       clka  => clka,
       ena   => ena,
       wea   => wea,
       addra => addra_sig(7 downto 0), 
       dina  => dina,
       clkb  => clkb, 
       addrb => addrb,
       doutb => doutb
    );

--  100 MHz
    clka <= not (clka) after 5 ns ;
    clkb <= not (clkb) after 5 ns ;

     process begin
        -- init setup 
        ena <= '1';
        
        if rising_edge (clka) then
            -- write / read
            wea(0) <= not addra_sig(8);
            addra <= addra_sig + '1';
            dina <= '0' & addra_sig(7 downto 0) & '0';
            wait for 100 ns;
        end if;    
        
     end process;    

end Behavioral;
