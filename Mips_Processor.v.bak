module Mips_Processor(clk , rest , MemResult_Out );

	input clk , rest ;
	output [15:0] MemResult_Out ; 
	
	//IFStage
	wire PowerFrezePC_SH , PCFreze_SH , brTaken , Jump , PCFreze_HD , MemRead , MemWrite ; 
	wire [15:0] brAddress  , JumpAddress , WriteDataForMemory , Address2 , MemResult , AddressPlus2 ;
	//IDStage
	wire HD_Mux_Sel , FrezeIFID_SH , FlushIFID_SH , FrezeIFID_HD , CompareFlag , RegWrite , Branch;
	wire [3:0] IDEXOp_Code , WriteRegister ,  HD_Rd , HD_Rt , IDEXOp_Code_Out , IDStageRd , IDStageRt ;
	wire [15:0]  Hi , Lo , SR , WriteData , Last_Controll_Signal , Source1 , Read1 , Source2 ;
	//Hazard_Detection_Unit
	wire MemRead_for_HD , RegWrite_for_HD ;
	//EXStage
	wire Alu_Resulr_Sel_In , FrezeIDEX_SH , EXStageMemRead , EXStageMemWite;
	wire [1:0] ForwardA_In , ForwardB_In , Controll_Signals_Sel_In ; 
	wire [3:0] WBStageRd , MEMStageRd , EXStageRd , EXStageRt;
	wire [15:0] Controll_Signals_Out , AluResult_Out_Or_Mem;
	//Structure

	//MemStage
	wire MemStageRegWrite , SpecialChangeEXMEM ;
	wire [3:0] MemStageRd_Out ;
	wire [15:0] MemStageAdder_Out , MemStageAlu_Out , MemStageControl_Signals_Out ; 
	//WBStage
	wire WBStageRegWrite , FrezeMEMWB ;

 
	//output
	//assign MemResult_Out = MemResult;
	//assign Read1_Out = Source1 ; 
	//assign Read2_Out = Source2 ; 
	//assign WriteDataReg_Out = WriteData ; 
	//assign  WriteRegister_Out = WriteRegister ; 
	//assign WriteDataForMem_Out ;



	IFStage IFStage(
		.clk(clk),
		.rest(rest),
		.PowerFrezePC_SH(PowerFrezePC_SH),
		.PCFreze_SH(PCFreze_SH),
		.brTaken(brTaken),
		.Jump(Jump),
		.PCFreze_HD(PCFreze_HD),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.brAddress(brAddress),
		.JumpAddress(JumpAddress),
		.WriteData(WriteDataForMemory),
		.Address2(Address2),
		.MemResult(MemResult),
		.AddressPlus2(AddressPlus2));


	IDStage IDStage(
		.clk(clk),
		.rest(rest),
		.HD_Mux_Sel(HD_Mux_Sel),
		.FrezeIFID_SH(FrezeIFID_SH),
		.FlushIFID_SH(FlushIFID_SH),
		.FrezeIFID_HD(FrezeIFID_HD),
		.CompareFlag(CompareFlag),
		.RegWrite(RegWrite),
		.brTaken_Out(brTaken),
		.Jump(Jump),
		.Branch(Branch),
		.IDEXOp_Code(IDEXOp_Code),
		.WriteRegister(WriteRegister),
		.HD_Rd(HD_Rd),
		.HD_Rt(HD_Rt),
		.IDEXOp_Code_Out(IDEXOp_Code_Out),
		.Rd(IDStageRd),
		.Rt(IDStageRt),
		.MemResult_In(MemResult),
		.PCPluse2_In(AddressPlus2),
		.Hi(Hi),
		.Lo(Lo),
		.SR(Sr),
		.WriteData(WriteData),
		.Last_Controll_Signal(Last_Controll_Signal),
		.Source1(Source1),
		.Read1(Read1),
		.Source2(Source2),
		.JumpAddress(JumpAddress),
		.BranchAddress(brAddress));

	Hazard_Detection_Unit Hazard_Detection_Unit(
		.rest(rest),
		.MemRead(MemRead_for_HD),
		.RegWrite(RegWrite_for_HD),
		.Branch(Branch),
		.Jump(Jump),
		.ControllSignal(HD_Mux_Sel),
		.FrezeIFID(FrezeIFID_HD),
		.FrezePC(PCFreze_HD),
		.IFID_Rs(HD_Rd),
		.IFID_Rt(HD_Rt),
		.IDEX_Rd(EXStageRd));

	EXStage EXStage(
		.clk(clk),
		.rest(rest),
		.Alu_Resulr_Sel_In(Alu_Resulr_Sel_In),
		.FrezeIDEX_SH(FrezeIDEX_SH),
		.ForwardA_In(ForwardA_In),
		.ForwardB_In(ForwardB_In),
		.Controll_Signals_Sel_In(Controll_Signals_Sel_In),
		.OpCode_In(IDEXOp_Code_Out),
		.EXMEMData(MemStageAlu_Out),
		.MEMWBData(WriteData),
		.Controll_Signals_In(Last_Controll_Signal),
		.Sourc1_In(Source1),
		.Source2_In(Source2),
		.Read1_In(Read1_In),
		.Rd_In(IDStageRd),
		.Rt_In(IDStageRt),
		.Mem_In(MemResult),
		.CompareFlag(CompareFlag),
		.OpCode_Out(IDEXOp_Code),
		.Controll_Signals_Out(Controll_Signals_Out),
		.Rd_Out(EXStageRd),
		.Rt_Out(EXStageRt),
		.AluResult_Out(AluResult_Out_Or_Mem),
		.Read1_Out(Read1),
		.Hi(Hi),
		.Lo(Lo),
		.SR(SR),
		.EXStageMemWite(EXStageMemWite),
		.EXStageMemRead(EXStageMemRead));

	StructureHazard_Unit StructureHazard_Unit(
		.rest(rest),
		.LWi(MemStageControl_Signals_Out[5]),
		.SWi(MemStageControl_Signals_Out[4]),
		.Add(MemStageControl_Signals_Out[3]),
		.MemRead(MemStageControl_Signals_Out[12]),
		.MemWrite(MemStageControl_Signals_Out[11]),
		.ControllSignals(Controll_Signals_Sel_In),
		.AluResultMux(Alu_Resulr_Sel_In),
		.PowerFrezePC(PowerFrezePC_SH),
		.FrezePC(PCFreze_SH),
		.FrezeIFID(FrezeIFID_SH),
		.FlushIFID(FlushIFID_SH),
		.FrezeIDEX(FrezeIDEX_SH),
		.SpecialChangeEXMEM(SpecialChangeEXMEM),
		.FrezeMEMWB(FrezeMEMWB));

	Forwarding Forwarding(
		.rest(rest),
		.IDEX_Register_Rd(EXStageRd),
		.IDEX_Register_Rt(EXStageRt),
		.EXMEM_Register_Rd(MEMStageRd),
		.EXMEM_Register_RegWrite(MemStageRegWrite),
		.MEMWB_Register_Rd(WBStageRd),
		.MEMWB_Register_RegWrite(WBStageRegWrite),
		.IDEXMemRead(EXStageMemRead),
		.IDEXMemWrite(EXStageMemWite),
		.ForwardA(ForwardA_In),
		.ForwardB(ForwardB_In));

	MemStage MemStage(
		.clk(clk),
		.rest(rest),
		.SpecialChangeEXMEM(SpecialChangeEXMEM),
		.Controll_Signal_In(Controll_Signals_Out),
		.Read1_In(Read1),
		.AluOrMem_In(AluResult_Out_Or_Mem),
		.Rd_In(EXStageRd),
		.Controll_Signal_Out(MemStageControl_Signals_Out),
		.Read1_Out(WriteDataForMemory),
		.AluOrMem_Out(MemStageAlu_Out),
		.Adder_Result_Out(MemStageAdder_Out),
		.Rd_Out(MemStageRd_Out));


	WBStage WBStage(
		.clk(clk),
		.rest(rest),
		.Freze(FrezeMEMWB),
		.Adde_In(MemStageAdder_Out),
		.Alu_In(MemStageAlu_Out),
		.Memory_In(MemResult),
		.Rd_In(MemStageRd_Out),
		.Controll_In(MemStageControl_Signals_Out),
		.WriteDataRegFile(WriteData),
		.Rd_Out(WBStageRd),
		.RegWrite(RegWrite));

	assign WriteRegister = WBStageRd ;
endmodule 