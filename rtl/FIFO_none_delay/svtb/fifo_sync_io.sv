//-----------------------------------------------------------------------------
// Title         : fifo_sync interface
// Project       : fifo_sync
//-----------------------------------------------------------------------------
// File          : fifo_sync_io.sv
// Author        : Minjae Kim <minjae@islab.re.kr>
// Created       : 2020-10-17
// Last modified : 2020-10-17
//-----------------------------------------------------------------------------
// Description :
// fifo_sync interface
//-----------------------------------------------------------------------------
// Copyright (C) ISLAB - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
//------------------------------------------------------------------------------
// Modification history :
// 2020-10-17 : fifo_sync interface generated using fastsim script
//------------------------------------------------------------------------------
interface fifo_sync_io(input bit clk);
   // Parameter

   // Input signal
   logic      rst_n;
   logic      en;
   logic      read;

   // Output signal
   logic      data_rd;

   // Input bus
   logic [7:0] data_i;

   // Output bus
   logic [7:0] data_o;

   // Interface input output description
   clocking cb @(posedge clk);
      default input #1ns output #1ns;

      input  data_rd;
      input  data_o;

      output rst_n;
      output en;
      output read;
      output data_i;
   endclocking:cb

  // modport
   modport TB(clocking cb);

endinterface
