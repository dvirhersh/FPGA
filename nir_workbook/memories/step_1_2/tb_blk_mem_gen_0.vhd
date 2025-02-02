----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2025 07:15:57 PM
-- Design Name: 
-- Module Name: tb_blk_mem_gen_0 - Behavioral
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

entity tb_blk_mem_gen_0 is
--  Port ( );
end tb_blk_mem_gen_0;

architecture Behavioral of tb_blk_mem_gen_0 is

    component blk_mem_gen_0
        port(
            clka  : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
        );
    end component;

    --in
    signal clka  : STD_LOGIC := '0';
    signal addra : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '1');
    --out
    signal douta : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
     clka <= not (clka) after 5 ns ;
     
     process begin 
        addra <= addra + '1';
        wait for 10 ns;
     end process;

    uut : blk_mem_gen_0
        port map (
        clka  => clka,
        addra =>  addra,
        douta => douta
        );

end Behavioral;
