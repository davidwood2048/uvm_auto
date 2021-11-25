`ifndef __${agent_name}_sequencer_sv__
    `define __${agent_name}_sequencer_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} monitor
//-----------------------------------------------------------------------------
//
// ${agent_name} sequencer
//
class ${agent_name}_sequencer extends uvm_sequencer #(${seq_name}_seq_item, ${seq_name}_seq_item);
    `uvm_component_utils(${agent_name}_sequencer)

    function new (string name = "${agent_name}_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

endclass // ${agent_name}_sequencer

`define __${agent_name}_sequencer_sv__
