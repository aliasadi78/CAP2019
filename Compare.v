module Comparator(A, B, Out);
	input [15:0] A, B;
	output Out;
	reg out;
assign Out = out;
always @(A or B)
	begin
		if(A == B)
			begin
				out <= 1;
			end
		else
			begin
				out <= 0;
			end

	end
endmodule
