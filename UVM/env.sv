`timescale 1 ps/ 1 ps
  
class uart_env extends uvm_env;

  `uvm_component_utils(uart_env)

  uart_agent agent;
  uart_scoreboard scb;

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    agent = uart_agent::type_id::create("agent",this); 
    scb = uart_scoreboard::type_id::create("scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    agent.mon.ap_port.connect(scb.ap_export);
  endfunction


endclass: uart_env
  
