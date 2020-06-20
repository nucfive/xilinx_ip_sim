//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/20 21:35:10
// Design Name: 
// Module Name: clocking_wized_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 				clocking wized sim  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
module clocking_wized_top
(
	 input           i_sys_clk   // 100M
	,input           i_rst_n     // low active
	,output          o_clk_out100
	,output          o_clk_out20
	,output          o_clk_out200
	,output          o_locked
);
		
clk_wiz_0  u_clk_wiz_0
(
	// Clock out ports
	.clk_out100    (o_clk_out100 ),
	.clk_out20     (o_clk_out20  ),
	.clk_out200    (o_clk_out200 ),
	// Status and control signals
	.resetn        (i_rst_n      ),
	.locked        (o_locked     ),
	// Clock in ports
	.clk_in1       (i_sys_clk    )
);
 
endmodule
