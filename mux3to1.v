module Mux3to1(A, B, C, Sel, Out);
	input [15:0] A, B, C;
	input [1:0] Sel;
	output [15:0] Out;
	reg [15:0] Out_register;
	assign Out = Out_register ;
always @(Sel or A or B or C)
	begin
		case(Sel)
			2'b10: Out_register <= A;
			2'b01: Out_register <= B;
			2'b00: Out_register <= C;
		endcase
	end
endmodule 
