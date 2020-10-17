module fifo_sync 
#( parameter FIFO_WIDTH = 8)
   (/*AUTOARG*/
   // Outputs
   data_rd, data_o,
   // Inputs
   clk, rst_n, en, read, data_i
   ) ;
   input                       clk;
   input                       rst_n;
   input                       en;
   input                       read;
   output                      data_rd;

   input [FIFO_WIDTH-1:0]      data_i;
   output [FIFO_WIDTH-1:0]     data_o;

   reg [FIFO_WIDTH-1:0]     data_o;
   reg                      data_rd;

   reg [3:0] top;

   wire [FIFO_WIDTH-1:0]  mems[16];
   assign mems[0] = data_i;

   genvar i;
   generate
      for(i = 0; i < 15; i = i + 1)begin : gen
         fifo #(.FIFO_WIDTH(FIFO_WIDTH) ) dut (
                                               // Outputs
                                               .data_o          (mems[i+1]),
                                               // Inputs
                                               .clk             (clk),
                                               .rst_n           (rst_n),
                                               .en             (en),
                                               .data_i          (mems[i]));
      end
   endgenerate

   always @(posedge clk or negedge rst_n)begin
      if(!rst_n) begin
         data_o <= 'b0;
         data_rd<= 'b0;
         top <= 4'h0;
      end else begin
         if(read)begin
            data_o  <= mems[top-1];
            data_rd <= 1'b1;
            top <= top != 4'h0 ? top - 4'b1 : top;
         end else if(en) begin
            top <= top != 4'hf ? top + 4'b1 : top;
         end
      end
   end

endmodule //fifo_sync
