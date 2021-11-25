`ifndef __${agent_name}_agent_object_sv__
    `define __${agent_name}_agent_object_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} agent configuration object
//-----------------------------------------------------------------------------
//
class ${agent_name}_agent_object extends uvm_object;
    `uvm_object_utils(${agent_name}_agent_object)

    bit ACTIVE = 1;

% for i in itf:
    virtual ${i}_if ${i}_vif;
% endfor

    function new(string name = "${agent_name}_agent_object");
        super.new(name);
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

endclass // ${agent_name}_agent_object

`endif //__${agent_name}_agent_object_sv__