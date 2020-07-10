module data_types();

bit data_1bit;
byte data_8bit;
shortint data_16bit;
int data_32bit;
longint data_64bit;
integer data_integer;

bit unsigned data_1bit_unsigned;
byte unsigned data_8bit_unsigned;
shortint unsigned data_16bit_unsigned;
int unsigned data_32bit_unsigned;
longint unsigned data_64bit_unsigned;
integer unsigned data_integer_unsigned;

initial begin 
    data_1bit = {32{4'b1111}};
    data_8bit = {32{4'b1111}};
    data_16bit = {32{4'b1111}};
    data_32bit = {32{4'b1111}};
    data_64bit = {32{4'b1111}};
    $display("data 1bit = %b",data_1bit);
    $display("data 8bit = %b",data_8bit);
    $display("data 16bit = %b",data_16bit);
    $display("data 32bit = %b",data_32bit);
    $display("data 64bit = %b",data_64bit);
    #1 $finish;
end

endmodule
