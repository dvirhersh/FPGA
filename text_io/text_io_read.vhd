----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2025 07:34:58 PM
-- Design Name: 
-- Module Name: text_io_read - Behavioral
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

entity text_io_read is
--  Port ( );
end text_io_read;



architecture Behavioral of text_io_read is

    signal status_out : boolean   := false ;
    signal c_out      : character := '?' ;

begin

charFromFile: process
    
    variable c : character := '?';
    file source_file : TEXT open READ_MODE is "C:\Users\dvirh\FPGA39course\text_io\text_io.sim\sim_1\behav\xsim\file_output_on_disk.txt";
    variable lineOfTextFromFile: line;
    variable status : boolean := false ;

begin
    while (not ENDFILE(source_file)) loop
        readline(source_file, lineOfTextFromFile);
        for I in 1 to lineOfTextFromFile'length loop
            read(lineOfTextFromFile, c, status);
            status_out <= status;
            if (status) then
                c_out <= c;
            else 
                c_out <= '?';
            end if;
            wait for 10 ns;
        end loop;
    end loop;

assert false
report "end of data file reached - simulation stops normally"
severity failure;

end process charFromFile;

end Behavioral;
