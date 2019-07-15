module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, Hi , Lo , SR, RegWrite, clk, rest, SR_Flag , ReadData1, ReadData2 , BA);
	input [3:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [15:0] WriteData , Hi , Lo , SR ;
	input RegWrite, clk, rest;
	output SR_Flag ;
	output [15:0] ReadData1, ReadData2 , BA;
	
	reg SR_Flag_register;
	reg [15:0] ReadData1_register, ReadData2_register , BA_register;
	assign SR_Flag = SR_Flag_register ; 
	assign ReadData1 =ReadData1_register ;
	assign ReadData2 = ReadData2_register ; 
	assign BA = BA_register ;
	reg [15:0] Registers [15:0];
integer i;
initial begin
	for (i = 0 ; i < 16 ; i = i+1) begin 
		Registers [i] <= 0 ;
	end
end
always @(posedge clk)
	begin	
		if (rest) begin 
			for (i = 0 ; i < 16 ; i = i+1) begin 
				Registers [i] <= 0 ;
			end
		end else begin 
			Registers[12] <= Hi ;
			Registers[13] <= Lo ;
			Registers[9] <= SR ;
			if (RegWrite == 1 && WriteRegister != 0 && WriteRegister != 12 && WriteRegister != 13 && WriteRegister !=9) 
				Registers[WriteRegister] <= WriteData;
		end
	end
	
always @(negedge clk)
	begin	
		SR_Flag_register <=Registers[9][15] ;
		BA_register <= Registers[10] ;
		ReadData1_register <= Registers[ReadRegister1];
		ReadData2_register <= Registers[ReadRegister2];
	end

endmodule
