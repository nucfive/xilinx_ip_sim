`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/26 20:18:37
// Design Name: 
// Module Name: fifo_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_top
(
	 input              i_sys_clk
	,input              i_rst_n
	,input    [15:0]    i_din
	,input              i_wr_en
	,input              i_rd_en
	,output   [15:0]    o_dout
	,output             o_empty
	,output             o_full
);
		
fifo_generator_0 u_fifo_generator_256x16
(
	.clk       (i_sys_clk ),//: IN STD_LOGIC;
	.srst      (~i_rst_n  ),//: IN STD_LOGIC;
	.din       (i_din     ),//: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	.wr_en     (i_wr_en   ),//: IN STD_LOGIC;
	.rd_en     (i_rd_en   ),//: IN STD_LOGIC;
	.dout      (o_dout    ),//: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	.full      (o_empty   ),//: OUT STD_LOGIC;
	.empty     (o_full    ) //: OUT STD_LOGIC
);
  
endmodule
