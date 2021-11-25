`ifndef __${agent_name}_driver_sv__
    `define __${agent_name}_driver_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} driver
//-----------------------------------------------------------------------------
//
class ${agent_name}_driver extends uvm_driver #(${seq_name}_seq_item, ${seq_name}_seq_item);
    `uvm_component_utils(${agent_name}_driver)

% for i in itf:
    virtual ${i}_if ${i}_vif;
% endfor

    ${seq_name}_seq_item data_pkt;
    uvm_analysis_port #(${seq_name}_seq_item) ap;

    function new (string name = "${agent_name}_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction // new
    
    // UVM Phases
    // Can just enable needed phase
    // @{
    //extern function void build_phase(uvm_phase phase);
    //extern function void connect_phase(uvm_phase phase);
    //extern function void end_of_elaboration_phase(uvm_phase phase);
    //extern function void start_of_simulation_phase(uvm_phase phase);
    //extern task          run_phase(uvm_phase phase);
    //extern task          reset_phase(uvm_phase phase);
    //extern task          configure_phase(uvm_phase phase);
    //extern task          main_phase(uvm_phase phase);
    //extern task          shutdown_phase(uvm_phase phase);
    //extern function void extract_phase(uvm_phase phase);
    //extern function void check_phase(uvm_phase phase);
    //extern function void report_phase(uvm_phase phase);
    //extern function void final_phase(uvm_phase phase);
    // }@

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //get i/f

    % for i in itf:
        if (!uvm_config_db #(virtual ${i}_if)::get(this, "", "${i}_vif", ${i}_vif) )
            `uvm_fatal(this.get_name(),"Cannot get '${i}_vif' from uvm_config_db")
    % endfor

        ap = new("ap",this);
    endfunction // build_phase

    task main_phase(uvm_phase phase);
        //get seq and drive
        forever begin
            seq_item_port.get_next_item(data_pkt);
            //
            //add driver logic here:
            //
            seq_item_port.item_done();
        end
    endtask // main_phase

endclass // ${agent_name}_driver

`endif // __${agent_name}_driver_sv__