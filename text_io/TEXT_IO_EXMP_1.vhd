----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2025 10:05:54 PM
-- Design Name: 
-- Module Name: TEXT_IO_EXMP_1 - Behavioral
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

entity TEXT_IO_EXMP_1 is
--  Port ( );
end TEXT_IO_EXMP_1;

architecture Behavioral of TEXT_IO_EXMP_1 is

begin

    process 
    
--        file input_file1  : text open read_mode is "C:\Yelement102_dirt.txt";
--        file output_file1 : text open write_mode is "C:\median_out_nir.txt";
        variable line_val : line;
        file write_file   : text open write_mode is "C:\Users\dvirh\FPGA39course\text_io\\nir_exmap.txt";
    begin
        for i in 0 to 100 loop
            write(line_val,"the value is "&integer'image(i)&"  ");
            writeline(write_file,line_val);
            wait for 10ns;
        end loop;
        
    end process;

end Behavioral;
