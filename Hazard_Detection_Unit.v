module Hazard_Detection_Unit(rest , MemRead , IFID_Rs , IFID_Rt , IDEX_Rd , ControllSignal , FrezeIFID , FrezePC);

	input rest , MemRead ;
	input [15:0] IFID_Rs , IFID_Rt , IDEX_Rd ;
	output ControllSignal , FrezeIFID , FrezePC ;

	reg ControllSignal_register , FrezeIFID_register , FrezePC_register ;
	assign ControllSignal = ControllSignal_register ;
	assign FrezeIFID = FrezeIFID_register ;
	assign FrezePC = FrezePC_register ;

	always @(rest , MemRead) begin 
		if(rest) begin 
			ControllSignal_register <= 1 ;
			FrezeIFID_register <= 0 ;
			FrezePC_register <= 0 ;

		end else begin 
			if(MemRead && (IFID_Rs == IDEX_Rd || IFID_Rt== IDEX_Rd )) begin 
				ControllSignal_register <= 0 ;
				FrezeIFID_register <= 1 ;
				FrezePC_register <= 1 ;
			end else begin 
				ControllSignal_register <= 1 ;
				FrezeIFID_register <= 0 ;
				FrezePC_register <= 0 ;
			end 
		end 
	end 
endmodule 