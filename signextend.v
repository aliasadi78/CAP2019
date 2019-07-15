module signExtend (in, out);
  input [7:0] in;
  output [15:0] out;
  reg [15:0] Out;
assign out = Out;
always @(in)
	begin
		Out <= (in[7] == 1) ? {8'b11111111, in} : {8'b00000000, in};
	end
endmodule 