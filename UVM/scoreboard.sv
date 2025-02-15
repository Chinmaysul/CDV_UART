class uart_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(uart_scoreboard)
    
  uvm_analysis_imp #(uart_trans, uart_scoreboard) ap_export;
  uart_trans q[$];

  function new(string name = "uart_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    ap_export = new("ap_export", this);
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
    
  function void write(uart_trans item);
    q.push_back(item);
    if (q.size()>0 && item.done) begin
      if(item.rx_data_out != item.tx_data_in) begin
        `uvm_info("SCOREBOARD", $sformatf("Data mismatch! Expected: %h, Actual: %h", item.tx_data_in,item.rx_data_out),UVM_MEDIUM)
      end
      else begin
        `uvm_info("SCOREBOARD", $sformatf("PASS! Expected: %h, Actual: %h", item.rx_data_out,item.rx_data_out),UVM_MEDIUM)
      end
    end
  endfunction: write
    
          


endclass
