//memory is big endian
module Memory ( rest ,Mem_Address , Mem_Read , Mem_Write , Write_Data , Result);
	input wire [15:0] Mem_Address;          // Memory Address
	input wire [15:0] Write_Data;    // Data for write to memory
	input wire Mem_Write, Mem_Read;  // Control signal
	input wire rest;                  // rest signal
	output [15:0] Result;     // Output of Memory
	
	reg [15:0] Result_register ;
	assign Result = Result_register ;


	reg [7:0] Instruction_Data_Memory[0:4095];  // 4095 register of 8-bit(1_BYT) for instruction & data memory: 0:1023 for instruction and 1024:4095 for data

integer i;
initial begin
  Result_register <= 0;
  for (i = 0; i < 4095; i = i + 1) begin
    Instruction_Data_Memory[i] = i;
  end
end

// posetive edge clock
always @( * ) begin
  //Instruction fetch
  if ( Mem_Write == 1'b0 && Mem_Read == 1'b0 ) begin
    if (Mem_Address > 1023 )
      Result_register <= 0 ;
    else
      Result_register[15:8] <= Instruction_Data_Memory[Mem_Address];
      Result_register[7:0] <= Instruction_Data_Memory[Mem_Address+1];
  // Data Memory
  end else begin 
    if (Mem_Read == 1'b1) begin
      Result_register[15:8] <= Instruction_Data_Memory[Mem_Address];
      Result_register[7:0] <= Instruction_Data_Memory[Mem_Address+1];
    end else if (Mem_Write == 1'b1) begin
      Instruction_Data_Memory[Mem_Address] <= Write_Data[15:8];
      Instruction_Data_Memory[Mem_Address+1] <= Write_Data[7:0];
    end
  end
end

endmodule
