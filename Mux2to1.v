module Mux_2to1(A, B, Sel, Out);
	input [15:0] A, B;
	input Sel;
	output Out;
	reg [15:0] Out;
always @(A or B or Sel)
	if (Sel == 1'b0)
		Out = A;
	else
		Out = B;
endmodule 