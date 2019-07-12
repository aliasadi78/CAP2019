module Forwarding(rest , IDEX_Register_Rd , IDEX_Register_Rt , EXMEM_Register_Rd , EXMEM_Register_RegWrite , MEMWB_Register_Rd , MEMWB_Register_RegWrite ,IDEXMemRead , IDEXMemWrite, ForwardA , ForwardB);
	input rest , MEMWB_Register_RegWrite , EXMEM_Register_RegWrite ,IDEXMemRead , IDEXMemWrite;
	input [3:0] IDEX_Register_Rd , IDEX_Register_Rt , EXMEM_Register_Rd , MEMWB_Register_Rd ;
	output [1:0] ForwardA , ForwardB ;

	reg [1:0] ForwardA_Register , ForwardB_Register ;

	assign ForwardA= ForwardA_Register ;
	assign ForwardB= ForwardB_Register ;

	always @(rest or MEMWB_Register_RegWrite or EXMEM_Register_RegWrite or IDEXMemRead or IDEXMemWrite or IDEX_Register_Rd or IDEX_Register_Rt or EXMEM_Register_Rd or MEMWB_Register_Rd) begin 
		ForwardA_Register <= 2 ;
		ForwardB_Register <= 2 ;
		if (rest) begin 
			ForwardA_Register <= 2 ;
			ForwardB_Register <= 2 ;

		end else begin 
			if (MEMWB_Register_RegWrite && MEMWB_Register_Rd != 0 ) begin 
				if (IDEX_Register_Rd == MEMWB_Register_Rd)
					ForwardA_Register <= 1 ;
				if (MEMWB_Register_Rd == 10 && (IDEXMemRead || IDEXMemWrite)) 
					ForwardA_Register <= 1 ;
				if (IDEX_Register_Rt == MEMWB_Register_Rd)
					ForwardB_Register <= 1 ;
			end
			if (EXMEM_Register_RegWrite && EXMEM_Register_Rd != 0 ) begin 
				if (IDEX_Register_Rd == EXMEM_Register_Rd)
					ForwardA_Register <= 0 ; 
				if (IDEX_Register_Rd == 10 && (IDEXMemRead || IDEXMemWrite)) 
					ForwardA_Register <= 0 ;
				if (IDEX_Register_Rt == EXMEM_Register_Rd)
					ForwardB_Register <= 0 ;
			end 	 
		end 
	end
endmodule 