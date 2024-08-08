entity logic_function is
port (
x1 : in bit;
x2 : in bit;
x3 : in bit;
x4 : in bit;

y1 : out bit;
y2 : out bit;
y3 : out bit;

y1inv : out bit;
y2inv : out bit;
y3inv : out bit
);
end entity logic_function;

architecture logic of logic_function is
begin
y1 <= (x3 and x4) or (x1 and x2 and x4) or (x1 and x3) or (x1 and not x2 and not x4);
y2 <= (not x1 and x3 and not x4) or (x1 and not x3 and not x4) or (x1 and not x2 and not x3) or (not x1 and x2 and not x3 and x4) or (x1 and x2 and x3 and x4);
y3 <= (x1 and x2) or (not x2 and x4);
y1inv <= (x2 and not x3 and not x4) or (not x1 and not x3) or (not x2 and not x3 and x4) or (not x1 and not x4);
y2inv <= (not x1 and not x2 and not x3) or (not x1 and not x3 and not x4) or (not x1 and x3 and x4) or (x1 and x2 and not x3 and x4) or (x1 and not x2 and x3);
y3inv <= (not x1 and x2) or (not x2 and not x4);
end architecture logic;