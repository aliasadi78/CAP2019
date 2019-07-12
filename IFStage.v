module IFStage(clk , rest , PowerFrezePC_SH , PCFreze_SH , brTaken , Jump , PCFreze_HD , brAddress  , JumpAddress , MemRead , MemWrite , WriteData , Address2 , MemResult , AddressPlus2);
	
	input clk , rest , PowerFrezePC_SH , PCFreze_SH , brTaken , Jump , PCFreze_HD , MemRead , MemWrite ;
	input [15:0] brAddress  , JumpAddress , WriteData , Address2 ;
	output [15:0] MemResult , AddressPlus2 ;

	wire [15:0] Adder_Out , BranchOrPC_Out , PCAddress , PC_Out , MemAddress ;
	wire SourceOfMemSel , Freza;
	assign SourceOfMemSel = MemWrite || MemRead ;
	assign Adder_Out = AddressPlus2 ;
	assign Freze = PowerFrezePC_SH || ((PCFreze_SH || PCFreze_HD) && !Jump && !brTaken) ;

	Mux2to1 BranchOrPC (
		.A(brAddress),
		.B(Adder_Out) ,
		.Sel(brTaken) ,
		.Out(BranchOrPC_Out));

	Mux2to1 JumpOrPC(
		.A(JumpAddress),
		.B(BranchOrPC_Out),
		.Sel(Jump),
		.Out(PCAddress));

	PC PC_register(
		.clk(clk),
		.rest(rest),
		.PC_In(PCAddress),
		.PC_Out(PC_Out),
		.Freze(Freze));

	adder16bit IFAdder(
		.A(16'b0000000000000010),
		.B(PC_Out),
		.Out(Adder_Out));

	Mux2to1 SourceOfMem(
		.A(Address2),
		.B(PC_Out),
		.Sel(SourceOfMemSel),
		.Out(MemAddress));

	Memory Ins_Data_Mem(
		.rest(rest),
		.Mem_Address(MemAddress),
		.Mem_Read(MemRead),
		.Mem_Write(MemWrite),
		.Write_data(WriteData),
		.Result(MemResult));
endmodule 