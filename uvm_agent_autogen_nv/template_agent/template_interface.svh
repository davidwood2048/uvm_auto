`ifndef __${agent_name}_interface_sv__
    `define __${agent_name}_interface_sv__
//-----------------------------------------------------------------------------
// Note:
//
// ${agent_name} interface
//-----------------------------------------------------------------------------
//
% for i in itf:
//
    interface ${i}_if#(int DW=512,type DW_T=logic[DW-1:0]) (input clk,rst);
        logic ready;
        logic valid;
        DW_T  data ;

        modport mst (
            input ready,
            output valid,data
        );
        modport slv (
            output ready,
            input valid,data
        );
        modport mon (
            input ready,
            input valid,data
    );
    endinterface: ${i}_if

% endfor

`define //__${agent_name}_interface_sv__
