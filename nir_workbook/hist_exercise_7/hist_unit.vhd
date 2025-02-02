----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2025 01:04:27 PM
-- Design Name: 
-- Module Name: HIST_UNIT - Behavioral
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

entity HIST_UNIT is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           HIST_READY   : out STD_LOGIC;
           HIST_VALUE   : out STD_LOGIC_VECTOR (7 downto 0);
           VALUE_AMOUNT : out STD_LOGIC_VECTOR (9 downto 0));
end HIST_UNIT;

architecture Behavioral of HIST_UNIT is

    constant MAX_COUNTER       : integer := 2558;
    constant COLLECTION_TIME   : integer := 2046;
    constant PRESENTATION_TIME : integer := 2302; -- 256
    constant ZEROING_TIME      : integer := 256;

    COMPONENT blk_mem_gen_0 -- ROM
      PORT (
        clka  : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
      );
    END COMPONENT;
    
    COMPONENT blk_mem_gen_1 -- Singal Dual Port RAM
      PORT (
        clka  : IN STD_LOGIC;
        wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        dina  : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        clkb  : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) 
      );
    END COMPONENT;
    
    signal counter : std_logic_vector (11 downto 0) := (others => '1');
    
    -- For ROM
    -- out
    signal douta : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

    -- For Singal Dual Port RAM
    -- in 
    signal wea   : STD_LOGIC_VECTOR(0 DOWNTO 0) := (others => '0');
    signal addra : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    signal dina  : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
    signal addrb : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    -- out
    signal doutb_sig : STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');

    signal hist_ready_int : std_logic := '0';

begin

    -- Counter process
    process (CLK) begin
        if rising_edge (CLK) then
            if RST = '1' then
                counter <= (0 => '1', others => '1');
            elsif counter < MAX_COUNTER then
                counter <= counter + 1;
            else
                counter <= (others => '0');
            end if;
        end if;
    end process;
    
    -- DELAY process
    
    process (counter, douta, doutb_sig) begin
        if counter < COLLECTION_TIME then
            addra  <= douta;
            addrb  <= douta;
            wea(0) <= counter(0);
            dina   <= doutb_sig + 1;
            hist_ready_int <= '0';
        elsif counter <= PRESENTATION_TIME then
            wea(0) <= '0';
            -- addrb  <= counter - COLLECTION_TIME;
            addrb  <= std_logic_vector(to_unsigned((to_integer(unsigned(counter)) - COLLECTION_TIME), 8));
            hist_ready_int <= '1';
        else
            wea(0) <= '1';
            dina   <= (others => '0');
            -- addra  <= counter - PRESENTATION_TIME;
            addra  <= std_logic_vector(to_unsigned((to_integer(unsigned(counter)) - PRESENTATION_TIME), 8));
            hist_ready_int <= '0';
        end if;
    end process;

   -- Output assignments
    HIST_READY   <= hist_ready_int;
    HIST_VALUE   <= addrb;
    VALUE_AMOUNT <= doutb_sig;
    
    ROM : blk_mem_gen_0
      PORT MAP (
        clka  => CLK,
        addra => counter(10 downto 1),
        douta => douta
      );
    
    SDPR : blk_mem_gen_1
      PORT MAP (
        clka  => CLK,
        wea   => wea,
        addra => addra,
        dina  => dina,
        clkb  => CLK,
        addrb => addrb,
        doutb => doutb_sig
      );

end Behavioral;
