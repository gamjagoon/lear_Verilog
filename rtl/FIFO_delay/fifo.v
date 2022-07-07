module fifo #( parameter FIFO_WIDTH = 8) (
   // Outputs
   data_o,
   // Inputs
   clk, rst_n, data_i
   ) ;
   input  clk;
   input  rst_n;

   input [FIFO_WIDTH:0]  data_i;
   output [FIFO_WIDTH:0]  data_o;

   reg [FIFO_WIDTH:0] data_o;
   wire en;
   assign en = data_i[FIFO_WIDTH];

   always @(posedge clk or negedge rst_n)begin
      if(!rst_n) begin
         data_o <= 'b0;
      end else begin
         if(en) begin
            data_o <= data_i;
         end else begin
            data_o <= 'b0;
         end
      end
   end

endmodule 
