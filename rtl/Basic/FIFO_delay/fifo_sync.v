module fifo_sync #( parameter FIFO_WIDTH = 8)
   (/*AUTOARG*/
   // Outputs
   data_o, data_rd,
   // Inputs
   clk, rst_n, en, data_i, data_use
   ) ;
   input                       clk;
   input                       rst_n;

   input                       en;
   input [FIFO_WIDTH-1:0]      data_i;
   input                       data_use;
   output [FIFO_WIDTH-1:0]     data_o;
   output                      data_rd;

   reg [FIFO_WIDTH-1:0]     data_o;
   reg                      data_rd;

   wire [FIFO_WIDTH:0]  mems[0:9];
   assign mems[0] = {en,data_i};

   genvar i;
   generate
      for(i = 0; i < 9; i = i + 1)begin : gen
         fifo #(.FIFO_WIDTH(FIFO_WIDTH) ) dut (
                                               // Outputs
                                               .data_o          (mems[i+1]),
                                               // Inputs
                                               .clk             (clk),
                                               .rst_n           (rst_n),
                                               .data_i          (mems[i]));
      end
   endgenerate

   always @(posedge clk or negedge rst_n)begin
      if(!rst_n) begin
         data_o <= 'b0;
         data_rd<= 'b0;
      end else begin
         if(mems[9][FIFO_WIDTH])begin
            data_o  <= mems[9][FIFO_WIDTH-1:0];
            data_rd <= 1'b1;
         end else if(data_use) begin
            data_rd <= 1'b0;
         end 
      end
   end

endmodule //fifo_sync
