// Synchronous clock with asynchronous reset
input             clk;
input             rst_n;



module example (/*AUTOARG*/ ) ;
   
endmodule //example

//-----------------------------------------------------------------------------
// Title         : <title>
// Project       : <project>
//-----------------------------------------------------------------------------
// File          : example.v
// Author        : 김민재  <gimminjae@islab.re.kr>
// Created       : 14.07.2020
// Last modified : 14.07.2020
//-----------------------------------------------------------------------------
// Description :
// <description>
//-----------------------------------------------------------------------------
// Copyright (c) 2020 by ISLab This model is the confidential and
// proprietary property of ISLab and the possession or use of this
// file requires a written license from ISLab.

//-----------------------------------------------------------------------------
// Title       : Edge Detector (clk)
//-----------------------------------------------------------------------------

reg  r_clk_edge;
wire w_clk_pe;
wire w_clk_ne;

always @ (posedge clk or negedge rst_n) begin
   if(!rst_n)begin
      r_clk_edge <= 1'b0;
   end else begin
      r_clk_edge <= clk;
   end
end

   assign w_clk_ne = r_clk_edge && (!clk);
   assign w_clk_pe = (!r_clk_edge) && clk;

//------------------------------------------------------------------------------
// Modification history :
// 14.07.2020 : Created by 김민재
//-----------------------------------------------------------------------------




//-----------------------------------------------------------------------------
// Title       : Counter
//-----------------------------------------------------------------------------
reg [7:0] cnt;

// Watchdog Control Singal
wire   cnt_init;  // counter init signal
wire   cnt_incr;  // counter increase signal

assign cnt_init = ;
assign cnt_incr = ;

always @ (posedge clk or negedge rst_n) begin
   if(!rst_n)begin
      cnt <= 'd0;
   end else begin
      if(cnt_init) begin
         cnt <= 'd0;
      end else if (cnt_incr)begin
         cnt <= cnt + 'd1;
      end
   end
end



//-----------------------------------------------------------------------------
// Title       : <title>
// Description : <description>
//-----------------------------------------------------------------------------


module example (/*AUTOARG*/ ) ;
   
endmodule //example



//-----------------------------------------------------------------------------
// Title       : Posedge Detector (clk)
//-----------------------------------------------------------------------------
reg  r_clk_edge;
wire w_clk_pe;

always @ (posedge clk or negedge rst_n) begin
   if(!rst_n)begin
      r_clk_edge <= 1'b0;
   end else begin
      r_clk_edge <= clk;
   end
end

assign w_clk_pe = (!r_clk_edge) && clk;


   //-----------------------------------------------------------------------------
   // Title       : MUX 4:1 
   //-----------------------------------------------------------------------------
   reg [8:0] out;

   always @ (*) begin
      case()
        2'b00   : out = ;
        2'b01   : out = ;
        2'b10   : out = ;
        2'b11   : out = ;
        default : out = ;
     endcase
   end //mux4:out

   //-----------------------------------------------------------------------------
   // Title       : Register with set
   //-----------------------------------------------------------------------------
   reg [8:0] out;

   // Register Control Singal
   wire   out_en;
   assign out_en = ;

   always @ (posedge clk or negedge rst_n) begin
      if(!rst_n)begin
         out <= 'd0;
      end else begin
         if(out_en) begin
            out <= 1;
         end
      end
   end


   //-----------------------------------------------------------------------------
   // Title       : Watchdog
   //-----------------------------------------------------------------------------
   reg [8:0] out;
   reg       out_busy;

   // Watchdog Control Singal
   wire   out_init; // watchdog start signal
   wire   out_last; // watchdog timeout signal
   wire   out_halt; // watchdog halt signal

   assign out_last = (out == 'd);

   always @ (posedge clk or negedge rst_n) begin
      if(!rst_n)begin
         out      <= 'd0;
         out_busy <= 1'b0;
      end else begin
         if(out_halt | out_init | out_last) begin
            out      <= 'd0;
            out_busy <= out_init & !out_halt;
         end else if (out_busy)begin
            out      <= out + 'd1;
            out_busy <= !out_last;
         end
      end
   end


//-----------------------------------------------------------------------------
// Title       : Finite State Machine Localparam
//-----------------------------------------------------------------------------
localparam example           = 3'b001;
localparam example2              = 3'b010;
localparam asdf              = 3'b100;

//-----------------------------------------------------------------------------
// Title       : Finite State Machine Register
//-----------------------------------------------------------------------------
reg [2:0] c_state, n_state;

always @ (posedge clk or negedge rst_n) begin
   if(!rst_n)begin
      c_state <= example;
   end else begin
      c_state <= n_state;
   end
end

//-----------------------------------------------------------------------------
// Title       : FSM State Transition
//-----------------------------------------------------------------------------
always @ (*) begin
    n_state = c_state;
    case(c_state)
      example : begin
      end
      end : begin
      end
      asdf : begin
      end
      default : begin
         n_state = example;
      end
    endcase
end

//-----------------------------------------------------------------------------
// Title       : FSM State Signals
//-----------------------------------------------------------------------------
always @ (*) begin
   // Add Default Signal Here
   case(c_state)
     example : begin
        end
        end : begin
        end
        asdf : begin
        end
        default : begin
        end
     endcase
end
