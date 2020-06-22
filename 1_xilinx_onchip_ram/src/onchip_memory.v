
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 01:40:49
// Design Name: 
// Module Name: onchip_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//      simulate single prot ram
//               simple dual port ram
//               true dual prot ram 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//`define SINGLE_PORT_RAM
`define SIMPLE_DUAL_PORT_RAM
module onchip_memory
(
	 input             i_sys_clk
	,input             i_rst_n
`ifdef SINGLE_PORT_RAM
	,input             i_ena
	,input             i_wea
	,input    [7:0]    i_addra
	,input    [15:0]   i_dina
	,output   [15:0]   o_douta
`endif	

`ifdef SIMPLE_DUAL_PORT_RAM
	,input             i_ena
	,input             i_wea
	,input    [7:0]    i_addra
	,input    [15:0]   i_dina
	,input             i_sys_clkb
	,input             i_enb
	,input             i_web
	,input    [7:0]    i_addrb
	,output   [15:0]   o_doutb
`endif

);

`ifdef SINGLE_PORT_RAM	
single_port_ram_256x16  u_single_port_ram_256x16
(
	.clka    (i_sys_clk ),// IN STD_LOGIC;
	.ena     (i_ena     ),// IN STD_LOGIC;
	.wea     (i_wea     ),// IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	.addra   (i_addra   ),// IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	.dina    (i_dina    ),// IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	.douta   (o_douta   )// OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
`endif

`ifdef SIMPLE_DUAL_PORT_RAM
simple_dual_port_ram_256x16 u_simple_dual_port_ram_256x16
(
    .clka   (i_sys_clk  ), //: IN STD_LOGIC;
    .ena    (i_ena      ), //: IN STD_LOGIC;
    .wea    (i_wea      ), //: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    .addra  (i_addra    ), //: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    .dina   (i_dina     ), //: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    .clkb   (i_sys_clkb ), //: IN STD_LOGIC;
    .enb    (i_enb      ), //: IN STD_LOGIC;
    .addrb  (i_addrb    ), //: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    .doutb  (o_doutb    ) //: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
`endif

endmodule
