module string_ex() ;

string my_string = "This is a original string";

initial begin
    $display("My String = %s",my_string);
    my_string = "Kim min jae";
    $display("My String = %s",my_string);
    #1 $finish;
end

endmodule
