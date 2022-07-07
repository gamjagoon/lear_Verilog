module fifo 
#( parameter FIFO_WIDTH = 8) ( /*AUTOARG*/
   // Outputs
   data_o,
   // Inputs
   clk, rst_n, en, data_i
   ) ;
   input  clk;
   input  rst_n;
   input  en;

   input [FIFO_WIDTH-1:0]  data_i;
   output [FIFO_WIDTH-1:0]  data_o;

   reg [FIFO_WIDTH-1:0] data_o;

   always @(posedge clk or negedge rst_n)begin
      if(!rst_n) begin
         data_o <= 'b0;
      end else begin
         if(en) begin
            data_o <= data_i;
         end 
      end
   end

endmodule 
