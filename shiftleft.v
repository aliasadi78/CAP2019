module ShiftLeft(in, out , rest);
	input rest ; 
	input [15:0] in;
	output [15:0] out;
	reg [15:0] Out;
assign out = Out;

always @(in or rest)
	begin
		if (rest) 
			Out <= 0 ;
		else
			Out <= in << 1;
	end
endmodule 