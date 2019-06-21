`timescale 1ns / 1ps

module Signextend(clk, extend, extended);
	input clk;
	input [7:0] extend;
	output [15:0] extended;
	wire [7:0] extend;
	reg [15:0] extended;

always
	begin 
		while(clk == 1)
			extended[7:0] = extend[7:0];
			extended[15:8] = {8{extend[7]}};
	end
endmodule 