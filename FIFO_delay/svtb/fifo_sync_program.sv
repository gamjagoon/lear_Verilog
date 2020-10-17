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
      @(io.cb);
      dbg_status();
      print_div();
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

   // sig_init
   task sig_init(input [7:0] d_in);
      $display("SCENARIO : sig_init");
      print_div();
      io.cb.en <= 1'b1;
      io.cb.data_use <= 1'b0;
      io.cb.data_i <= d_in;
      @(io.cb);
   endtask: sig_init

   // all_test0
   task all_test0();
      io.cb.en <= 1'b0;
      io.cb.data_use <= 1'b0;
      @(io.cb);
   endtask: all_test0

   task wait_and_use(input [7:0] data);
      while(io.cb.data_rd == 1'b0)begin
         @(io.cb);
      end
      dbg_bus(data);
      io.cb.data_use <= 1'b1;
      @(io.cb);
   endtask: wait_and_use

   // scenario1
   task scenario1();
      $display("SCENARIO : scenario1");
      print_div();
      sig_reset();
      sig_init(8'hA1);
      sig_init(8'hA2);
      all_test0();
      sig_init(8'hB1);
      sig_init(8'hB2);
      all_test0();
      wait_and_use(8'hA1);
      wait_and_use(8'hA2);
      wait_and_use(8'hB1);
      wait_and_use(8'hB2);
      // PLZ ADD scenario1 SEQUENCE
   endtask: scenario1

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
