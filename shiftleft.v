module ShiftLeft (rest , A, Out);
	input rest ;
	input [15:0] A;
	output [15:0] Out;

assign Out = A<<1;

endmodule
