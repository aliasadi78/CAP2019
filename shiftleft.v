module ShiftLeft(in, out);
	input [15:0] in;
	output [15:0] out;
	reg [15:0] Out;
assign out = Out;

always @(in, out)
	begin
		Out = in << 1;
	end
endmodule