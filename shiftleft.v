module ShiftLeft(in, out);
	input [15:0] in;
	output [15:0] out;
	reg [15:0] Out;
assign out = Out;

always @(in, out)
	begin
		Out = {in[13:0], 2'b00};
	end
endmodule