//-----------------------------------------------------------------------------
// Title         : fifo_sync svtb top module
// Project       : fifo_sync
//-----------------------------------------------------------------------------
// File          : fifo_sync_top.sv
// Author        : Minjae Kim <minjae@islab.re.kr>
// Created       : 2020-10-17
// Last modified : 2020-10-17
//-----------------------------------------------------------------------------
// Description :
// fifo_sync svtb top module
//-----------------------------------------------------------------------------
// Copyright (C) ISLAB - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
//------------------------------------------------------------------------------
// Modification history :
// 2020-10-17 : fifo_sync svtb top module generated using fastsim script
//------------------------------------------------------------------------------
module fifo_sync_top;
   // Parameter
   parameter PERIOD = 100;

   bit SystemClock;

   /* Connect Program and DUT Using IO*/

   fifo_sync_io top_io (
         SystemClock
      );

   fifo_sync_program test (
         top_io
      );

   fifo_sync dut (
         .clk(top_io.clk),
         .rst_n(top_io.rst_n),
         .en(top_io.en),
         .data_use(top_io.data_use),
         .data_i(top_io.data_i),
         .data_rd(top_io.data_rd),
         .data_o(top_io.data_o)
      );

   /* SystemClock Generation */
   initial begin
      SystemClock = 0;
      forever begin
         #(PERIOD/2)
         SystemClock = ~SystemClock;
      end
   end
endmodule
