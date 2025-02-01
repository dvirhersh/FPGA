----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2025 07:19:49 PM
-- Design Name: 
-- Module Name: text_io_write - Behavioral
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

entity text_io_write is
--  Port ( );
end text_io_write;

architecture Behavioral of text_io_write is

begin
    messageToConsole: process
        variable message1 : string(1 to 36) := "***> Starting circuit initialization";
        variable message2 : string(1 to 36) := "***> Circuit initialization complete";
        variable message3 : string(1 to 59) := "***> Beginning Test run for compliance against spec D3.14.1";
        variable lineOut : line;
        
    begin
        wait for 1 ps;
    
        write(lineOut, time'image(now) & ": " & message1);
        writeline(OUTPUT, lineOut);
        wait for 50 ns;
        
        write(lineOut, time'image(now) & ": " & message2);
        writeline(OUTPUT, lineOut);
        wait for 100 ns;

        write(lineOut, time'image(now) & ": " & message3);
        writeline(OUTPUT, lineOut);
        wait;

   end process messageToConsole;

end Behavioral;
