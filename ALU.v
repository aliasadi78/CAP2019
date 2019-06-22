module ALU(A, B, OP, BA, Out, Carry_out,Mem_out);
	input [15:0] A, B;
	input [3:0] OP;
	input BA;
	output Mem_out;
	output [15:0] Out;
	output Carry_out;

	reg [15:0] alu_result;
	wire [16:0] tmp;

assign Out = alu_result;
assign tmp = {1'b0,A} + {1'b0,B};
assign Carry_out = tmp[8];

always @(*)
	begin
		case(OP)
			4'b0000 : alu_result = A + B;
			4'b0001 : alu_result = A + (BA + (2 * B));
			4'b0010 : alu_result = A - B;
			4'b0011 : alu_result = A + (2 * B);
			4'b0100 : alu_result = A * B;
			4'b0101 : alu_result = A & B;
			4'b0110 : alu_result = A << B;
			4'b0111 : alu_result = BA + (2 * B);
			//4'b0100 : alu_result = A * B;
		endcase
	end
endmodule 

			