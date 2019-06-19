module Memory ( Mem_Address , Mem_Read , Mem_Write , Write_Data , Result , clk );
	input wire [15:0] Mem_Address;          // Memory Address
	input wire [15:0] Write_Data;    // Data for write to memory
	input wire Mem_Write, Mem_Read;  // Control signal
	input wire clk;                  // Clock signal
	output reg [15:0] Result;     // Output of Memory

	reg [15:0] Instruction_Data_Memory[0:2047];  // 2048 words of 16-bit for instruction & data memory: 0:511 for instruction and 512:2047 for data

integer i;
initial begin
  Result <= 0;
  for (i = 0; i < 2047; i = i + 1) begin
    Instruction_Data_Memory[i] = i;
  end
end

// posetive edge clock
always @(posedge clk) begin
  //Instruction fetch
  if ( Mem_Write == 1'b0 && Mem_Read == 1'b0 ) begin
    if (Mem_Address > 511 )
      Result <= 0 ;
    else
      Result <= Instruction_Data_Memory[Mem_Address];
  // Data Memory
  end else begin 
    if (Mem_Read == 1'b1)
      Result <= Instruction_Data_Memory[Mem_Address];
    else if (Mem_Write == 1'b1)
      Instruction_Data_Memory[Mem_Address] <= Write_Data;
  end
end

endmodule