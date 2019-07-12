module PC(clk , rest , PC_In , PC_Out , Freze);
	input clk , rest , Freze;
	input [15:0] PC_In ;
	output [15:0] PC_Out ;
	
	reg [15:0] PC_Out_register ;
	assign PC_Out = PC_Out_register ; 

	always @(posedge clk) begin 
		if (rest == 0)
			PC_Out_register <= 0 ;
		else 
			if (!Freze)
				PC_Out_register <= PC_In ; 

	end 

endmodule 