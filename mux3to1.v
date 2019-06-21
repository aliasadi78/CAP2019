module Mux_3to1(A, B, C, Sel, Out);
	input [15:0] A, B, C;
	input [1:0] Sel;
	output [15:0] Out;
	reg [15:0] Out;
always @(Sel or A or B or C)
	begin
		case(Sel)
			2'b00: Out = A;
			2'b01: Out = B;
			2'b10: Out = C;
		endcase
	end
endmodule 
