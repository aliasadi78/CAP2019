module ALU (A, B, Op, result, Hi, Low, Status);
	input [15:0] A, B;
	input [2:0] Op;
	output [15:0] result, Hi, Low, Status;
	
	reg [15:0] Alu_result;
	reg [15:0] hi, low;
	reg [31:0] mul_result;
	reg [15:0] sub_result;
	reg [15:0] status;
	wire [16:0] tmp;
	

assign result = Alu_result;
assign Hi = hi;
assign Low = low;
assign Status = status;
assign tmp = {1'b0,A} + {1'b0,B};
assign carry = tmp[16];


always @(A, B, result, Hi, Low, Status)
	begin
		status[13] <= carry;
		case(Op)
			3'b000: Alu_result <= 0;
			3'b001:
				begin
					Alu_result <= A + B;
					if(A > 0 & B < 0)
						begin
							status[12] <= 0;
						end
					if(A < 0 & B > 0)
						begin
							status[12] <= 0;
						end
					if(A > 0 & B > 0 & Alu_result[15] == 1)
						begin
							status[12] <= 1;
						end
					if(A < 0 & B < & Alu_result[15] == 0)
						begin
							status[12] <= 1;
						end
				end
			
			3'b010: 
				begin
					Alu_result <= A - B;
					if(A > 0 & B > 0)
						begin
							status[12] <= 0;
						end
					if(A < 0 & B < 0)
						begin
							status[12] <= 0;
						end
					if(A < 0 & B > 0 & Alu_result[15] == 0)
						begin
							status[12] <= 1;
						end
					if(A > 0 & B < & Alu_result[15] == 1)
						begin
							status[12] <= 1;
						end
				end
			3'b011: Alu_result <= A & B;
			3'b100: Alu_result <= B;
			3'b101: Alu_result <= A << B;
			3'b110: 
				begin
				mul_result <= A * B;
				hi <= mul_result[31:16];
				low <= mul_result[15:0];
				end
			3'b111: 
				begin
					sub_result <= A - B;
					if(A > 0 & B > 0)
						begin
							status[12] <= 0;
						end
					if(A < 0 & B < 0)
						begin
							status[12] <= 0;
						end
					if(A < 0 & B > 0 & Alu_result[15] == 0)
						begin
							status[12] <= 1;
						end
					if(A > 0 & B < & Alu_result[15] == 1)
						begin
							status[12] <= 1;
						end

					if(sub_result == 0)
						begin
							status[15] <= 1;
						end
					else if (sub_result < 0)
						begin
							status[14] <= 1;
						end
					else
						begin
				 			status[15] <= 0;
							status[14] <= 0;
				 		end
				end
		endcase
	end
endmodule 