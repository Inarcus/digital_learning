LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


PACKAGE package_lab6 IS
 
type my_signal is record
clk:std_logic;
enable:std_logic;
WR:std_logic;
RD:std_logic;
A:std_logic_vector(7 downto 0);
data_in:std_logic_vector(7 downto 0);
data_out:std_logic_vector(7 downto 0);
end record my_signal;


END package_lab6;