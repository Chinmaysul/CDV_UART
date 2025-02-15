`timescale 1 ps/ 1 ps

`include "uvm_macros.svh"
import uvm_pkg::*;

class uart_trans extends uvm_sequence_item;


  `uvm_object_utils(uart_trans)

  bit rx;
  rand bit [7:0] tx_data_in;
  bit start;
  bit tx;
  bit [7:0] rx_data_out;
  bit tx_active;
  bit done_tx;
  bit done;


  function new (string name = "");
    super.new(name);
  endfunction

endclass: uart_trans
