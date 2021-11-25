`ifndef __${agent_name}_monitor_sv__
    `define __${agent_name}_monitor_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} monitor
//-----------------------------------------------------------------------------
//
class ${agent_name}_monitor extends uvm_monitor;
    `uvm_component_utils(${agent_name}_monitor)

% for i in itf:
    virtual ${i}_if ${i}_vif;
% endfor

    ${seq_name}_seq_item data_pkt;

    uvm_analysis_port#(${seq_name}_seq_item) ap;

    function new(string name = "${agent_name}_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction // new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //get i/f

    % for i in itf:
        if (!uvm_config_db #(virtual ${i}_if)::get(this, "", "${i}_vif", ${i}_vif) )
            `uvm_fatal(this.get_name(),"Cannot get '${i}_vif' from uvm_config_db")
    % endfor

        ap = new("ap", this);
    endfunction // build_phase

    task main_phase(uvm_phase phase);
        bit pkt_done = 0;

        forever begin
            pkt_done = 0;
            data_pkt = ${seq_name}_seq_item::type_id::create("data_pkt", this);
            //
            //add monitor logic here:
            //
            #100;

            //pkt_done = 1;
            wait(pkt_done);

            if(pkt_done) begin
                ap.write(data_pkt);
            end
        end // forever begin
    endtask // main_phase

endclass // ${agent_name}_monitor

`endif // __${agent_name}_monitor_sv__