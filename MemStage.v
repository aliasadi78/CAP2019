module MemStage(clk , rest , SpecialChangeEXMEM , Controll_Signal_In , Read1_In , AluOrMem_In , Rd_In  , Controll_Signal_Out , Read1_Out , AluOrMem_Out , Adder_Result_Out , Rd_Out );

	input clk , rest , SpecialChangeEXMEM ; 
	input [15:0]  Controll_Signal_In , Read1_In , AluOrMem_In  ; 
	input [3:0] Rd_In ;
	output [3:0] Rd_Out ; 
	output [15:0] Controll_Signal_Out , Read1_Out , AluOrMem_Out , Adder_Result_Out ;



	Adder16bit adder16bit(
		.rest(rest),
		.A(Read1_In),
		.B(AluOrMem_In),
		.Out(Adder_Result_Out));

	EX2MEM_register EX2MEM_register(
		.clk(clk),
		.rest(rest),
		.Special_Change(SpecialChangeEXMEM),
		.Controll_Signal_In(Controll_Signal_In),
		.Read1_In(Read1_In),
		.AluOrMem_In(AluOrMem_In),
		.Rd_In(Rd_In),
		.Controll_Signal_Out(Controll_Signal_Out),
		.Read1_Out(Read1_Out),
		.AluOrMem_Out(AluOrMem_Out),
		.Rd_Out(Rd_Out));

endmodule 
	
