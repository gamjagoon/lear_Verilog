//-----------------------------------------------------------------------------
// Title         : fifo_sync test program
// Project       : fifo_sync
//-----------------------------------------------------------------------------
// File          : fifo_sync_program.sv
// Author        : Minjae Kim <minjae@islab.re.kr>
// Created       : 2020-10-17
// Last modified : 2020-10-17
//-----------------------------------------------------------------------------
// Description :
// fifo_sync test program
//-----------------------------------------------------------------------------
// Copyright (C) ISLAB - All Rights Reserved
// Unauthorized copying of this file, via any medium is strictly prohibited
// Proprietary and confidential
//------------------------------------------------------------------------------
// Modification history :
// 2020-10-17 : fifo_sync test program generated using fastsim script
//------------------------------------------------------------------------------
program automatic fifo_sync_program(fifo_sync_io.TB io);
   // Parameter

   initial begin
      print_div();
      scenario1();
   end


   task print_div();
      $display("----------------------------------------------------");
   endtask: print_div


   task sig_reset();
      $display("SCENARIO : reset");
      print_div();
      io.cb.rst_n <= 1'b0;
      repeat(4) @(io.cb);
      io.cb.rst_n <= 1'b1;
      repeat(1) @(io.cb);
   endtask: sig_reset

   task push (input [7:0] d_in);
      print_div();
      io.cb.en <= 1'b1;
      io.cb.read <= 1'b0;
      io.cb.data_i <= d_in;
      @(io.cb);
   endtask: push

   task pop(input [7:0] data);
      io.cb.en <= 1'b0;
      io.cb.read <= 1'b1;
      @(io.cb);
      io.cb.en <= 1'b0;
      io.cb.read <= 1'b0;
      dbg_bus(data);
   endtask: pop


   // scenario1
   task scenario1();
      sig_reset();
      push(8'h40);
      push(8'h41);
      push(8'h42);
      push(8'h43);
      pop(8'h40);
      pop(8'h41);
      pop(8'h42);
      pop(8'h43);
      pop(8'h00);
      // PLZ ADD scenario1 SEQUENCE
      @(io.cb);
   endtask: scenario1

   // Debug out
   task dbg_status();
      $display("DBG : Current Status");
      $display("   * data_rd	 : %x ", io.cb.data_rd );
      $display("   * data_o	 : %x ", io.cb.data_o );
   endtask: dbg_status

   // Debug out
   task dbg_bus(input [7:0]data);
      $display("DBG : Current Bus Data");
      $display("   * data_o	 : %x ", io.cb.data_o );
      if(data == io.cb.data_o) begin
      $display("PASS");
      end else begin
      $display("FAIL");
      end
   endtask: dbg_bus


endprogram
