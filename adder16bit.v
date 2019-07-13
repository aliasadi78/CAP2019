module n_bit_adder(A, B, Out);
	parameter n = 16;
	input [n - 1 : 0] A, B;
	output [n - 1 : 0] Out;

	reg [15:0] status;
	wire Carry_Out;
	wire [n - 1 : 0] Carry;

	wire [16:0] tmp;
	reg [15:0] Alu_result;

assign tmp = {1'b0,A} + {1'b0,B};
assign carry = tmp[16];
	genvar i;
   	generate
		for(i = 0; i < n; i = i + 1) 
		begin: generate_N_bit_Adder
			if(i == 0)
				half_adder f(A[0], B[0], Out[0], Carry[0]);
			else
				full_adder f(A[i], B[i], Carry[i - 1], Out[i], Carry[i]);
		end
		assign Carry_out = Carry[n - 1];
	endgenerate

endmodule

module half_adder(X, Y, Sum, Carry);
	input X,Y;
	output Sum, Carry;
assign Sum = X ^ Y;
assign Carry = X & Y;

endmodule

module full_adder(X, Y, Carry_in, Sum, Carry_out);
	input X, Y, Carry_in;
	output Sum, Carry_out;
assign Sum = (X ^ Y) ^ Carry_in;
assign Carry_out = (Y & Carry_in) | (X & Y) |(X & Carry_out);

endmodule 