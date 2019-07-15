module EXStage(clk , rest , CompareFlag , FrezeIDEX_SH , Controll_Signals_In , OpCode_In, EXMEMData , MEMWBData , Sourc1_In , Source2_In , Read1_In , Rd_In , Rt_In , Mem_In , EXStageMemRead , EXStageMemWite,
		 Controll_Signals_Sel_In , Alu_Resulr_Sel_In , ForwardA_In , ForwardB_In ,Controll_Signals_Out , AluResult_Out , Read1_Out , Rd_Out , Rt_Out , Hi , Lo , SR, OpCode_Out);


	input clk , rest , Alu_Resulr_Sel_In , FrezeIDEX_SH ; 
	input [1:0] ForwardA_In , ForwardB_In , Controll_Signals_Sel_In ; 
	input [3:0] OpCode_In , Rd_In , Rt_In ; 
	input [15:0] Controll_Signals_In , Sourc1_In , Source2_In , Read1_In , Mem_In , EXMEMData , MEMWBData ;
	output CompareFlag , EXStageMemRead , EXStageMemWite;
	output [3:0] OpCode_Out , Rd_Out , Rt_Out ;
	output [15:0] Controll_Signals_Out , AluResult_Out , Read1_Out , Hi , Lo , SR ; 

	wire [15:0] Controll_Signals_wire , Source1_wire , Source2_wire , AluSource1 , AluSource2 , AluResult ;
	assign EXStageMemRead = Controll_Signals_wire [12] ; 
	assign EXStageMemWite = Controll_Signals_wire [11] ;
	ID2EX_Register ID2EX_Register(
		.clk(clk),
		.rest(rest),
		.Freze(FrezeIDEX_SH),
		.Controll_Signal_In(Controll_Signals_In),
		.OpCode_In(OpCode_In),
		.Source1_In(Sourc1_In),
		.Read1_In(Read1_In),
		.Source2_In(Source2_In),
		.Rd_In(Rd_In),
		.Rt_In(Rt_In),
		.Controll_Signal_Out(Controll_Signals_wire),
		.OpCode_Out(OpCode_Out),
		.Source1_Out(Source1_wire),
		.Read1_Out(Read1_Out), 
		.Source2_Out(Source2_wire),
		.Rd_Out(Rd_Out),
		.Rt_Out(Rt_Out));
	Mux_4to1 Mux_4to1(
		.A(Controll_Signals_wire),
		.B(16'b1011010010000000),
		.C(16'b1010100010000000),
		.D(16'b0000010010000100),
		.Sel(Controll_Signals_Sel_In),
		.Out(Controll_Signals_Out));

	Mux3to1 Source1_Mux(
		.A(Source1_wire),
		.B(MEMWBData),
		.C(EXMEMData),
		.Sel(ForwardA_In),
		.Out(AluSource1));

	Mux3to1 Source2_Mux(
		.A(Source2_wire),
		.B(MEMWBData),
		.C(EXMEMData),
		.Sel(ForwardB_In),
		.Out(AluSource2));

	Comparator Compare(
		.A(AluSource1),
		.B(AluSource2),
		.Out(CompareFlag));

	ALU ALU(
		.A(AluSource1),
		.B(AluSource2),
		.Op(Controll_Signals_wire[9:7]),
		.result(AluResult),
		.Hi(Hi),
		.Low(Lo),
		.Status(SR));
	
	Mux2to1 Result(
		.A(AluResult),
		.B(Mem_In),
		.Sel(Alu_Resulr_Sel_In),
		.Out(AluResult_Out));
endmodule 