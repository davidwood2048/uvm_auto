`ifndef __${agent_name}_agent_pkg_sv__
    `define __${agent_name}_agent_pkg_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} agent pkg
//-----------------------------------------------------------------------------
//
    `timescale 1ns/1ps
    
    `include "${agent_name}_interface.svh"

    package ${agent_name}_agent_pkg;

        import uvm_pkg::*;
        `include "uvm_macros.svh"

        `include "${agent_name}_defines.svh"

        //import seq_item_pkg::*;

//components
        `include "${agent_name}_sequencer.svh"
        `include "${agent_name}_driver.svh"
        `include "${agent_name}_monitor.svh"

//agent
        `include "${agent_name}_agent_object.svh"
        `include "${agent_name}_agent.svh"

    endpackage // ${agent_name}_agent_pkg

`endif //${agent_name}_agent_pkg_sv__