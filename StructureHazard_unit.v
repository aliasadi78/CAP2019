module StructureHazard_Unit(rest , LWi , SWi , Add ,MemRead , MemWrite , ControllSignals , AluResultMux , PowerFrezePC , FrezePC , FrezeIFID , FlushIFID , FrezeIDEX , SpecialChangeEXMEM , FrezeMEMWB);

	input rest , LWi , SWi , Add , MemRead , MemWrite ; 
	output [1:0] ControllSignals ; 
	output AluResultMux , PowerFrezePC , FrezePC , FrezeIFID, FlushIFID , FrezeIDEX , SpecialChangeEXMEM , FrezeMEMWB ; 


	reg [1:0] ControllSignals_register ; 
	reg AluResultMux_register , PowerFrezePC_register , FrezePC_register , FrezeIFID_register , FlushIFID_register , FrezeIDEX_register , SpecialChangeEXMEM_register , FrezeMEMWB_register ;

	assign ControllSignals = ControllSignals_register ; 
	assign AluResultMux = AluResultMux_register ;
	assign PowerFrezePC = PowerFrezePC_register ;
	assign FrezePC = FrezePC_register ; 
	assign FrezeIFID = FrezeIFID_register ;
	assign FlushIFID = FlushIFID_register ;
	assign FrezeIDEX = FrezeIDEX_register ; 
	assign SpecialChangeEXMEM = SpecialChangeEXMEM_register ;
	assign FrezeMEMWB = FrezeMEMWB_register ; 
	initial begin 
		ControllSignals_register <= 3 ;
		AluResultMux_register <= 1 ;
		FrezePC_register <= 0 ;
		FrezeIFID_register <= 0 ;
		FrezeIDEX_register <= 0 ;
		SpecialChangeEXMEM_register <= 0 ;
		FrezeMEMWB_register <= 0 ;
	end	always @(rest or LWi or SWi or Add or MemRead or MemWrite) begin 
	if (rest) begin 
		ControllSignals_register <= 3 ;
		AluResultMux_register <= 1 ;
		FrezePC_register <= 0 ;
		FrezeIFID_register <= 0 ;
		FrezeIDEX_register <= 0 ;
		SpecialChangeEXMEM_register <= 0 ;
		FrezeMEMWB_register <= 0 ;
	end else begin 
		if (LWi)
			ControllSignals_register <= 2 ;
		else if (SWi)
			ControllSignals_register <= 1 ;
		else if (Add)
			ControllSignals_register <= 0 ;
		else ControllSignals_register <= 3 ;

		if (LWi || SWi || Add) begin 
			AluResultMux_register <= 0 ;
			//for lwi in mem and branch in id , if branch in id and lw in mem : pc should be change 
			PowerFrezePC_register <=1 ;
			FrezePC_register <= 1 ;
			FrezeIFID_register <= 1 ;
			FrezeIDEX_register <= 1 ;
			SpecialChangeEXMEM_register <= 1 ;
			FrezeMEMWB_register <=1 ;
		end else begin 
			PowerFrezePC_register <=0 ;
			AluResultMux_register <= 1 ;
			FrezePC_register <= 0 ;
			FrezeIFID_register <= 0 ;
			FrezeIDEX_register <= 0 ;
			SpecialChangeEXMEM_register <= 0 ;
			FrezeMEMWB_register <= 0 ;
		end 

		if (MemRead || MemWrite) begin 
			FrezePC_register <= 1 ;
			FlushIFID_register <= 1 ;
		end else begin 
			FrezePC_register <= 0 ;
			FlushIFID_register <= 0 ;
		end
	end
	end 

endmodule 