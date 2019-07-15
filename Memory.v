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
integer j = 0 ;  
initial begin
Instruction_Data_Memory [0] <= 8'b00001000;
Instruction_Data_Memory [1] <= 8'b00010000 ;
Instruction_Data_Memory [2] <= 8'b00100011 ; 
Instruction_Data_Memory [3] <= 8'b00010000;
Instruction_Data_Memory [4] <= 8'b10100011 ;
Instruction_Data_Memory [5] <= 8'b00000011 ;
Instruction_Data_Memory [6] <= 8'b00010011;
Instruction_Data_Memory [7] <= 8'b00010000 ;
Instruction_Data_Memory [8] <= 8'b00001011 ;
Instruction_Data_Memory [9] <= 8'b00000000 ;

for (i = 1024; i < 4096; i = i + 1)
	begin
		Instruction_Data_Memory[i] <= 0;
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
