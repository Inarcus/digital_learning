entity tb_logic is
end entity;
architecture tb of tb_logic is
signal x1, x2, x3, x4, y1, y2, y3, y1inv, y2inv, y3inv : bit;
begin
x1 <= not x1 after 40ns;
x2 <= not x2 after 20ns;
x3 <= not x3 after 10ns;
x4 <= not x4 after 5ns;
DUT : entity work.logic_function(logic)

port map(x1, x2, x3, x4, y1, y2, y3, y1inv, y2inv, y3inv);
end architecture tb;