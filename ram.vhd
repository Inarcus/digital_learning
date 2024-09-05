LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


USE work.package_lab6.ALL;

ENTITY RAM IS
  GENERIC (
    wb : INTEGER := 8;
    ab : INTEGER := 8
  );
  PORT (
    signals : INOUT my_signal
  );
END ENTITY RAM;
ARCHITECTURE ram_arch OF ram IS

type mem is array (0 to 2**ab-1) of std_logic_vector (wb-1 downto 0);
signal RAM256: mem;
signal start: boolean:=true;


BEGIN
 
process (signals.clk)
variable start: boolean:=true;
variable ram_addr_in: integer range 0 to 2**ab-1;

begin
if (start=true) then
ram256 <= (0 => "10101010",
1 => "00010001",
2 => "00100010",
3 => "00110011",
4 => "01000100",
5 => "01010101",
6 => "01100110",
7 => "10001000",
8 => "10011001",
9 => "10111011",
10 =>"11011101",
11 =>"11101110",
12 =>"11111111",
others => "00000000");

start:=false;
end if;
if (rising_edge (signals.clk)) then

if (signals.enable ='1') then
 
if (signals.WR ='1' and signals.RD ='0') then

 
ram_addr_in :=conv_integer (signals.A);
 ram256(ram_addr_in)<=signals.data_in;


elsif (signals.WR ='0'  and signals.RD ='1') then

ram_addr_in :=conv_integer (signals.A);
signals.data_out<=ram256(ram_addr_in);


elsif (signals.WR ='1' and  signals.RD ='1' ) then
ram_addr_in :=conv_integer (signals.A);
ram256(ram_addr_in)<=signals.data_in;
signals.data_out<=ram256(ram_addr_in);

else
signals.data_out<=(others=>'0');
end if;
else
signals.data_out<=(others=>'0');
end if;
end if;
end process;

END ARCHITECTURE ram_arch;
