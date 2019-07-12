module Hazard_Detection_Unit(rest , MemRead , RegWrite , Branch , Jump , IFID_Rs , IFID_Rt , IDEX_Rd , ControllSignal , FrezeIFID , FrezePC);

	input rest , MemRead , RegWrite , Branch , Jump ;
	input [15:0] IFID_Rs , IFID_Rt , IDEX_Rd ;
	output ControllSignal , FrezeIFID , FrezePC ;

	reg ControllSignal_register , FrezeIFID_register , FrezePC_register ;
	assign ControllSignal = ControllSignal_register ;
	assign FrezeIFID = FrezeIFID_register ;
	assign FrezePC = FrezePC_register ;

	always @(rest or MemRead or RegWrite) begin 
		if(rest) begin 
			ControllSignal_register <= 1 ;
			FrezeIFID_register <= 0 ;
			FrezePC_register <= 0 ;

		end else begin 
			if(MemRead && RegWrite && (IFID_Rs == IDEX_Rd || IFID_Rt== IDEX_Rd ) && !Branch && !Jump) begin 
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