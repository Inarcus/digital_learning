module tb_logic;

reg x1, x2, x3, x4;
wire y1, y2, y3;
wire y1inv, y2inv, y3inv;

logic_function DUT (
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y1inv(y1inv),
    .y2inv(y2inv),
    .y3inv(y3inv)
);


initial begin

    x1 = 0;
    x2 = 0;
    x3 = 0;
    x4 = 0;
    
    forever begin
        #40 x1 = ~x1;
    end
end

initial begin
    forever begin
        #20 x2 = ~x2;
    end
end

initial begin
    forever begin
        #10 x3 = ~x3;
    end
end

initial begin
    forever begin
        #5 x4 = ~x4;
    end
end

endmodule

