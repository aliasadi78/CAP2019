module Mux_4to1(A, B, C, D , Sel, Out);
	input [15:0] A, B, C , D;
	input [1:0] Sel;
	output [15:0] Out;
	reg [15:0] Out_register;
	assign Out = Out_register ;
always @(Sel or A or B or C or D)
	begin
		case(Sel)
			2'b11: Out_register = A;
			2'b10: Out_register = B;
			2'b01: Out_register = C;
			2'b00: Out_register = D;
		endcase
	end
endmodule 
