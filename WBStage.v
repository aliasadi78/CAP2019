module WBStage(clk , rest , Freze , Adder_In , Alu_In , Memory_In , Rd_In , Controll_In , WriteDataRegFile, Rd_Out , RegWrite);

	input clk , rest , Freze ; 
	input [15:0]  Adder_In , Alu_In , Memory_In , Rd_In , Controll_In ;
	output RegWrite ;
	output [3:0] Rd_Out ; 
	output [15:0] WriteDataRegFile ; 

	wire [15:0] Controll_Signal_Out , Add_Result_Out , Mem_Result_Out , Alu_Result_Out ;

	MEM2WB_register MEM2WB_register(
		.clk(clk),
		.rest(rest),
		.Freze(Freze),
		.Controll_Signal_In(Controll_In),
		.Add_Result_In(Adder_In),
		.Mem_Result_In(Memory_In),
		.Alu_Result_In(Alu_In),
		.Rd_In(Rd_In),
		.Controll_Signal_Out(Controll_Signal_Out),
		.Add_Result_Out(Add_Result_Out),
		.Mem_Result_Out(Mem_Result_Out),
		.Alu_Result_Out(Alu_Result_Out),
		.Rd_Out(Rd_Out));

	assign RegWrite = Controll_Signal_Out[10];

	Mux3to1 WriteDataRegFile_Mux(
		.A(Add_Result_Out),
		.B(Alu_Result_Out),
		.C(Mem_Result_Out),
		.Sel(Controll_Signal_Out[2:1]),
		.Out(WriteDataRegFile));

endmodule 