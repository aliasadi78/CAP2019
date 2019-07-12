`timescale 1ns / 1ps

module Signextend(rest ,extend, extended);
	input rest ; 
	input [7:0] extend;
	output [15:0] extended;
	
	reg [15:0] extended_register;
	assign extended = extended_register ; 

always @(extend)
	begin 
		extended_register[7:0] = extend[7:0];
		extended_register[15:8] = {8{extend[7]}};
	end
endmodule 