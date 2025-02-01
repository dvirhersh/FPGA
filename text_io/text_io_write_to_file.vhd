----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2025 07:36:12 PM
-- Design Name: 
-- Module Name: text_io_write_to_file - Behavioral
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity text_io_write_to_file is
--  Port ( );
end text_io_write_to_file;

architecture Behavioral of text_io_write_to_file is

begin

    stuffToFile : process
        variable message1  : string(1 to 36) := "***> Starting circuit initialization";
        variable charValue : character := '-';
        variable intValue  : integer range 0 to 100 := 45;
        file source_file   : TEXT open WRITE_MODE is "file_output_on_disk.txt";
        variable lineOut   : line;
    begin
        wait for 1 ps;
        
        write(lineOut, time'image(now) & ": " & message1);
        writeline(source_file, lineOut);
        wait for 50 ns;
        
    end process stuffToFile;

end Behavioral;
