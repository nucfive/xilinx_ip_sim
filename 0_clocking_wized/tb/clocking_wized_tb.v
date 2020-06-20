
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/20 21:42:49
// Design Name: 
// Module Name: clocking_wized_tb
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
module clocking_wized_tb;

reg      [4:0]        marker0         ;
reg      [4:0]        marker1         ;
reg      [4:0]        marker2         ;
reg                   i_sys_clk       ;       	
reg                   i_rst_n         ;         
wire                  o_clk_out100	  ;    
wire                  o_clk_out20     ;
wire                  o_clk_out200    ;
wire                  o_locked        ;

clocking_wized_top u_clocking_wized_top
(
	.i_sys_clk       (i_sys_clk       ), // 100M
	.i_rst_n         (i_rst_n         ), // low active
	.o_clk_out100    (o_clk_out100    ), 
	.o_clk_out20     (o_clk_out20     ), 
	.o_clk_out200    (o_clk_out200    ), 
	.o_locked        (o_locked        )
);

initial begin
	i_sys_clk = 1'b1;
	i_rst_n   = 1'b0;
	marker0   = 5'd0;
	marker1   = 5'd0;
	marker2   = 5'd0;
	#132 i_rst_n = 1'b1;
	#3000 $stop();
end

always #5 i_sys_clk = ~i_sys_clk;

always @ (posedge o_clk_out100 or negedge o_locked) begin
	if(!o_locked)
		marker0 <= 5'd0;
	else 
		marker0 <= marker0 + 5'd1;
end

always @ (posedge o_clk_out20 or negedge o_locked) begin
	if(!o_locked)
		marker1 <= 5'd0;
	else 
		marker1 <= marker1 + 5'd1;
end

always @ (posedge o_clk_out200 or negedge o_locked) begin
	if(!o_locked)
		marker2 <= 5'd0;
	else 
		marker2 <= marker2 + 5'd1;
end

endmodule
