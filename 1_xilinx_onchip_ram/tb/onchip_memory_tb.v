
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/21 02:00:02
// Design Name: 
// Module Name: onchip_memory_tb
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
//`define SINGLE_PORT_RAM
`define SIMPLE_DUAL_PORT_RAM
module onchip_memory_tb;

reg             i_sys_clk;
reg             i_rst_n;
reg    [9:0]    marker;
`ifdef SINGLE_PORT_RAM

reg             i_ena;
reg             i_wea;
reg    [7:0]    i_addra;
reg    [15:0]   i_dina;
wire   [15:0]   o_douta;
`endif	

`ifdef SIMPLE_DUAL_PORT_RAM
reg    [9:0]    markerb;
reg             i_ena;
reg             i_wea;
reg    [7:0]    i_addra;
reg    [15:0]   i_dina;
reg             i_sys_clkb;
reg             i_enb;
reg             i_web;
reg    [7:0]    i_addrb;
wire   [15:0]   o_doutb;
`endif

onchip_memory u_onchip_memory
(
	.i_sys_clk    (i_sys_clk    ),
	.i_rst_n      (i_rst_n      ),
`ifdef SINGLE_PORT_RAM
	.i_ena        (i_ena        ),
	.i_wea        (i_wea        ),
	.i_addra      (i_addra      ),
	.i_dina       (i_dina       ),
	.o_douta      (o_douta      )
`endif	

`ifdef SIMPLE_DUAL_PORT_RAM
	.i_ena        (i_ena        ),
	.i_wea        (i_wea        ),
	.i_addra      (i_addra      ),
	.i_dina       (i_dina       ),
	.i_sys_clkb   (i_sys_clkb   ),
	.i_enb        (i_enb        ),
	.i_web        (i_web        ),
	.i_addrb      (i_addrb      ),
	.o_doutb      (o_doutb      )
`endif
);

initial begin
	i_sys_clk = 1'b0;
	i_rst_n = 1'b0;
	marker = 10'd0;
`ifdef SINGLE_PORT_RAM	
	i_ena = 1'b0;       
	i_wea = 1'b0;       
	i_addra = 8'd0;     
	i_dina  = 16'd0;    	
`endif

`ifdef SIMPLE_DUAL_PORT_RAM
	i_ena  = 1'b0;	
	i_wea  = 1'b0;
	i_addra = 8'd0;     
	i_dina  = 16'd0;     
	i_sys_clkb = 1'b0;  
	i_enb = 1'b0;       
	i_web = 1'b0;       
	i_addrb = 8'd0; 
	markerb = 10'd0;	
`endif
	#132 i_rst_n = 1'b1;
	#5000 $stop();
end	


always #10 i_sys_clk = ~i_sys_clk;

`ifdef SIMPLE_DUAL_PORT_RAM
always #20 i_sys_clkb = ~i_sys_clkb;
`endif

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		marker <= 10'd0;
	else 
		marker <= marker + 10'd1;
end

`ifdef SINGLE_PORT_RAM
always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_ena <= 1'b0;
	else if((marker >= 10) && (marker <= 265))
		i_ena <= 1'b1;
	else if((marker >= 299) && (marker <= 554))
		i_ena <= 1'b1;
	else 
		i_ena <= 1'b0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_wea <= 1'b0;
	else if((marker >= 10) && (marker <= 265))
		i_wea <= 1'b1;
	else 
		i_wea <= 1'b0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_addra <= 8'd0;
	else if((marker >= 11) && (marker <= 265) && (i_wea))
		i_addra <= i_addra + 8'd1;
	else if((marker >= 300) && (marker <= 554) && (!i_wea))
		i_addra <= i_addra + 8'd1;
	else if(!i_wea)
		i_addra <= 8'd0;
	else 
		i_addra <= 8'd0;
end
 
always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_dina <= 16'd0;
	else if((marker >= 11) && (marker <= 265) && (i_wea))
		i_dina <= {$random} % 256;
	else 
		i_dina <= 16'd0;
end	
`endif

`ifdef SIMPLE_DUAL_PORT_RAM
always @ (posedge i_sys_clkb or negedge i_rst_n) begin
	if(!i_rst_n)
		markerb <= 10'd0;
	else 
		markerb <= markerb + 10'd1;
end
// A port
always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_ena <= 1'b0;
	else if((marker >= 10) && (marker <= 265))
		i_ena <= 1'b1;
	else if((marker >= 299) && (marker <= 554))
		i_ena <= 1'b1;
	else 
		i_ena <= 1'b0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_wea <= 1'b0;
	else if((marker >= 10) && (marker <= 265))
		i_wea <= 1'b1;
	else 
		i_wea <= 1'b0;
end

always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_addra <= 8'd0;
	else if((marker >= 11) && (marker <= 265) && (i_wea))
		i_addra <= i_addra + 8'd1;
	else if((marker >= 300) && (marker <= 554) && (!i_wea))
		i_addra <= i_addra + 8'd1;
	else if(!i_wea)
		i_addra <= 8'd0;
	else 
		i_addra <= 8'd0;
end
 
always @ (posedge i_sys_clk or negedge i_rst_n) begin
	if(!i_rst_n)
		i_dina <= 16'd0;
	else if((markerb >= 11) && (markerb <= 265) && (i_wea))
		i_dina <= {$random} % 256;
	else 
		i_dina <= 16'd0;
end	

// b port
always @ (posedge i_sys_clkb or negedge i_rst_n) begin
	if(!i_rst_n)
		i_enb <= 1'b0;
	else if((markerb >= 150) && (markerb <= 406))
		i_enb <= 1'b1;
	else 
		i_enb <= 1'b0;
end

always @ (posedge i_sys_clkb or negedge i_rst_n) begin
	if(!i_rst_n)
		i_web <= 1'b0;
	else if((markerb >= 150) && (markerb <= 406))
		i_web <= 1'b1;
	else 
		i_web <= 1'b0;
end

always @ (posedge i_sys_clkb or negedge i_rst_n) begin
	if(!i_rst_n)
		i_addrb <= 8'd0;
	else if(markerb >= 151 && markerb <= 405)
		i_addrb <= i_addrb + 8'd1;
	else 
		i_addrb <= 8'd0;
end 



`endif

	
endmodule
