module events();

event ack;
event done = ack;

event empty = null;

initial begin
    #1 -> ack;
    #1 ->emtpy;
    #1 -> done;
    #1 $finish;
end

always @(ack)
begin
    $display("ack evnet emitted");
end

always @ (done)
begin
    $display("done event emitted");
end

endmodule
