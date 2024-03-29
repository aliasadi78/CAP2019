module Mux2to1(A, B, Sel, Out);
	input [15:0] A, B;
	input Sel;
	output [15:0] Out;
	reg [15:0] Out_register;
	assign Out = Out_register ;
always @(A or B or Sel)
	if (Sel == 1)
		Out_register <= A;
	else
		Out_register <= B;
endmodule 