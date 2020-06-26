//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/26 20:26:22
// Design Name: 
// Module Name: fifo_tb
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
`timescale 1ns / 1ps
module fifo_tb;

reg    [9:0]     marker;
reg              i_sys_clk; 
reg              i_rst_n;   
reg    [15:0]    i_din;     
reg              i_wr_en;   
reg              i_rd_en;   
wire   [15:0]    o_dout;    
wire             o_empty;   
wire             o_full;    

fifo_top u_fifo_top
(
	.i_sys_clk (i_sys_clk ),
	.i_rst_n   (i_rst_n   ),
	.i_din     (i_din     ),
	.i_wr_en   (i_wr_en   ),
	.i_rd_en   (i_rd_en   ),
	.o_dout    (o_dout    ),
	.o_empty   (o_empty   ),
	.o_full    (o_full    )
);

initial begin
	i_sys_clk = 1'b0;
	i_rst_n = 1'b0;
	i_din = 16'd0;
	i_wr_en = 1'b0;
	i_rd_en = 1'b0;
	marker = 10'd0;
	#132 i_rst_n = 1'b1;
	#6000 $stop();
end

always #10 i_sys_clk = ~i_sys_clk;

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		marker <= 10'd0;
	else 
		marker <= marker + 10'd1;
end


always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n) 
		i_din <= 16'd0;
	else if(marker >= 10 && marker <= 265)
		i_din <= {$random} % 256;
	else 
		i_din <= 16'd0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_wr_en <= 1'b0;
	else if(marker >= 10 && marker <= 265)
		i_wr_en <= 1'b1;
	else 
		i_wr_en <= 1'b0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_rd_en <= 1'b0;
	else if(marker >= 300 && marker <= 555)
		i_rd_en <= 1'b1;
	else 	
		i_rd_en <= 1'b0;
end

endmodule
