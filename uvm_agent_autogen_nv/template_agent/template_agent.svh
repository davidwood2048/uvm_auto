`ifndef __${agent_name}_agent_sv__
    `define __${agent_name}_agent_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} agent
//-----------------------------------------------------------------------------
//
class ${agent_name}_agent extends uvm_agent;
    `uvm_component_utils(${agent_name}_agent)

    ${agent_name}_driver m_${agent_name}_driver;
    ${agent_name}_sequencer m_${agent_name}_sequencer;
    ${agent_name}_monitor m_${agent_name}_monitor;

    ${agent_name}_agent_object m_${agent_name}_agent_object;

% for i in itf:
    virtual ${i}_if ${i}_vif;
% endfor

    uvm_analysis_port #(${seq_name}_seq_item) ap;
    uvm_analysis_port #(${seq_name}_seq_item) ap_transfer;

    function new(string name = "${agent_name}_agent", uvm_component parent = null);
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
        if (!uvm_config_db #(${agent_name}_agent_object)::get(this, "", "m_${agent_name}_agent_object", m_${agent_name}_agent_object) )
            `uvm_fatal("CONFIG_LOAD", "Cannot get() configuration ${agent_name}_agent_config from uvm_config_db")

        % for i in itf:
        uvm_config_db #(virtual ${i}_if)::set(this, "m_${agent_name}_driver", "${i}_vif", m_${agent_name}_agent_object.${i}_vif);
        uvm_config_db #(virtual ${i}_if)::set(this, "m_${agent_name}_monitor", "${i}_vif", m_${agent_name}_agent_object.${i}_vif);
        % endfor

        if(m_${agent_name}_agent_object.ACTIVE) begin
            m_${agent_name}_driver = ${agent_name}_driver::type_id::create("m_${agent_name}_driver", this);
            m_${agent_name}_sequencer = ${agent_name}_sequencer::type_id::create("m_${agent_name}_sequencer", this);
            m_${agent_name}_monitor = ${agent_name}_monitor::type_id::create("m_${agent_name}_monitor", this);
            ap = new("ap", this);
            ap_transfer = new("ap_transfer", this);
        end
    endfunction// build_phase

    function void connect_phase(uvm_phase phase);
        if(m_${agent_name}_agent_object.ACTIVE) begin
            m_${agent_name}_driver.seq_item_port.connect(m_${agent_name}_sequencer.seq_item_export);
            m_${agent_name}_monitor.ap.connect(ap);
            m_${agent_name}_driver.ap.connect(ap_transfer);
        end
    endfunction // connect_phase

endclass // ${agent_name}_agent

`endif __${agent_name}_agent_sv__
