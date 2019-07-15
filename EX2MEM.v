module EX2MEM_register(clk , rest , Special_Change , Controll_Signal_In , Read1_In , AluOrMem_In , Rd_In , Controll_Signal_Out , Read1_Out , AluOrMem_Out , Rd_Out  );

	input clk , rest , Special_Change ;
	input [3:0] Rd_In ;
	input [15:0] Controll_Signal_In , Read1_In , AluOrMem_In;
	output[3:0] Rd_Out ;
	output [15:0]  Controll_Signal_Out , Read1_Out , AluOrMem_Out;
	
	reg [15:0] Controll_Signal_Out_register , Read1_Out_register , AluOrMem_Out_register , Rd_Out_register ;
	assign Controll_Signal_Out = Controll_Signal_Out_register ;
	assign Read1_Out = Read1_Out_register ; 
	assign AluOrMem_Out = AluOrMem_Out_register ;
	assign Rd_Out = Rd_Out_register ; 
	initial begin
Controll_Signal_Out_register <= 0 ;
			Read1_Out_register <= 0 ;
			AluOrMem_Out_register <= 0 ;
			Rd_Out_register <= 0 ;
	end
	always @(posedge clk) begin 
		if (rest) begin 
			Controll_Signal_Out_register <= 0 ;
			Read1_Out_register <= 0 ;
			AluOrMem_Out_register <= 0 ;
			Rd_Out_register <= 0 ;
		end else begin 
			if (Special_Change) begin 
				Controll_Signal_Out_register <= Controll_Signal_In ;
				AluOrMem_Out_register <= AluOrMem_In ;
			end else begin 
				Controll_Signal_Out_register <= Controll_Signal_In ;
				Read1_Out_register <= Read1_In ;
				AluOrMem_Out_register <= AluOrMem_In ;
				Rd_Out_register <= Rd_In ;
			end 
		end 

	end
endmodule 