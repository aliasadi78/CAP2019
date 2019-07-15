module ID2EX_Register(clk , rest , Freze , Controll_Signal_In , OpCode_In , Source1_In , Read1_In , Source2_In , Rd_In , Rt_In , Controll_Signal_Out , OpCode_Out , Source1_Out , Read1_Out , Source2_Out , Rd_Out , Rt_Out);
	input clk , rest , Freze ;
	input [3:0] OpCode_In , Rd_In , Rt_In ;
	output [3:0] OpCode_Out , Rd_Out , Rt_Out ;
	input [15:0]  Controll_Signal_In ,Source1_In , Read1_In , Source2_In  ;
	output [15:0] Controll_Signal_Out ,Source1_Out , Read1_Out , Source2_Out ;
	
	reg [15:0] Controll_Signal_Out_register ,Source1_Out_register , Read1_Out_register , Source2_Out_register , Rd_Out_register , Rt_Out_register ;
	assign Controll_Signal_Out = Controll_Signal_Out_register ; 
	assign Source1_Out = Source1_Out_register ;
	assign Read1_Out = Read1_Out_register ;
	assign Source2_Out = Source2_Out_register ;
	assign Rd_Out = Rd_Out_register ; 
	assign Rt_Out = Rt_Out_register ;
	reg [3:0] OpCode_Out_register ; 
	assign OpCode_Out = OpCode_Out_register ; 
	
	initial begin
Controll_Signal_Out_register <= 0 ;
			OpCode_Out_register <= 0 ;
			Source1_Out_register <= 0 ;
			Read1_Out_register <= 0 ;
			Source2_Out_register <= 0 ;
			Rd_Out_register <= 0 ;
			Rt_Out_register <= 0 ;
		end
	always @(posedge clk) begin 
		if (rest) begin 
			Controll_Signal_Out_register <= 0 ;
			OpCode_Out_register <= 0 ;
			Source1_Out_register <= 0 ;
			Read1_Out_register <= 0 ;
			Source2_Out_register <= 0 ;
			Rd_Out_register <= 0 ;
			Rt_Out_register <= 0 ;
		end
		else begin 
			if (!Freze) begin 
				Controll_Signal_Out_register <= Controll_Signal_In ;
				OpCode_Out_register <= OpCode_In ;
				Source1_Out_register <= Source1_In ;
				Read1_Out_register <= Read1_In ;
				Source2_Out_register <= Source2_In ;
				Rd_Out_register <= Rd_In ;	
				Rt_Out_register <= Rt_In ;
			end 
		end 
	end 

endmodule 
