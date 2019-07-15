module MEM2WB_register(clk , rest , Freze , Controll_Signal_In ,  Add_Result_In , Mem_Result_In , Alu_Result_In , Rd_In , Controll_Signal_Out , Add_Result_Out , Mem_Result_Out , Alu_Result_Out , Rd_Out );

	input clk , rest , Freze ; 
	input[15:0] Controll_Signal_In , Add_Result_In , Mem_Result_In , Alu_Result_In , Rd_In ;
	output[15:0]  Controll_Signal_Out , Add_Result_Out , Mem_Result_Out , Alu_Result_Out , Rd_Out ;

	reg [15:0]  Add_Result_Out_register , Mem_Result_Out_register , Alu_Result_Out_register , Rd_Out_register , Controll_Signal_Out_register ;
	assign Controll_Signal_Out = Controll_Signal_Out_register ;
	assign Add_Result_Out =Add_Result_Out_register ; 
	assign Mem_Result_Out = Mem_Result_Out_register ;
	assign Alu_Result_Out =Alu_Result_Out_register ;
	assign Rd_Out = Rd_Out_register ;


	always@(posedge clk) begin 
		if (rest) begin 
			Add_Result_Out_register <= 0 ;
			Mem_Result_Out_register <= 0 ;
			Alu_Result_Out_register <= 0 ; 
			Rd_Out_register <= 0 ;
		end else begin 
			if (!Freze) begin 
				Controll_Signal_Out_register <= Controll_Signal_In ; 
				Add_Result_Out_register <= Add_Result_In ;
				Mem_Result_Out_register <= Mem_Result_In ;
				Alu_Result_Out_register <= Alu_Result_In ; 
				Rd_Out_register <= Rd_In ;
			end 
		end 

	end
endmodule 