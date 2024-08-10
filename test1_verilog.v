module logic_function (
    input wire x1,
    input wire x2,
    input wire x3,
    input wire x4,
    
    output wire y1,
    output wire y2,
    output wire y3,
    
    output wire y1inv,
    output wire y2inv,
    output wire y3inv
);

assign y1 = (x3 & x4) | (x1 & x2 & x4) | (x1 & x3) | (x1 & ~x2 & ~x4);
assign y2 = (~x1 & x3 & ~x4) | (x1 & ~x3 & ~x4) | (x1 & ~x2 & ~x3) | (~x1 & x2 & ~x3 & x4) | (x1 & x2 & x3 & x4);
assign y3 = (x1 & x2) | (~x2 & x4);

assign y1inv = (x2 & ~x3 & ~x4) | (~x1 & ~x3) | (~x2 & ~x3 & x4) | (~x1 & ~x4);
assign y2inv = (~x1 & ~x2 & ~x3) | (~x1 & ~x3 & ~x4) | (~x1 & x3 & x4) | (x1 & x2 & ~x3 & x4) | (x1 & ~x2 & x3);
assign y3inv = (~x1 & x2) | (~x2 & ~x4);

endmodule

