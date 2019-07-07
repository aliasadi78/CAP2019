module StructureHazard_Unit(rest , LWi , SWi , Add ,MemRead , MemWrite , ControllSignals , AluResultMux , FrezePC , FrezeIFID , FlushIFID , FrezeIDEX , SpecialChangeEXMEM , FrezeMEMWB);

	input rest , LWi , SWi , Add , MemRead , MemWrite ; 
	output [1:0] ControllSignals ; 
	output AluResultMux , FrezePC , FrezeIFID, FlushIFID , FrezeIDEX , SpecialChangeEXMEM , FrezeMEMWB ; 


	reg [1:0] ControllSignals_register ; 
	reg AluResultMux_register , FrezePC_register , FrezeIFID_register , FlushIFID_register , FrezeIDEX_register , SpecialChangeEXMEM_register , FrezeMEMWB_register ;

	assign ControllSignals = ControllSignals_register ; 
	assign AluResultMux = AluResultMux_register ;
	assign FrezePC = FrezePC_register ; 
	assign FrezeIFID = FrezeIFID_register ;
	assign FlushIFID = FlushIFID_register ;
	assign FrezeIDEX = FrezeIDEX_register ; 
	assign SpecialChangeEXMEM = SpecialChangeEXMEM_register ;
	assign FrezeMEMWB = FrezeMEMWB_register ; 

	always @(rest , LWi , SWi , Add , MemRead , MemWrite) begin 
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
			FrezePC_register <= 1 ;
			FrezeIFID_register <= 1 ;
			FrezeIDEX_register <= 1 ;
			SpecialChangeEXMEM_register <= 1 ;
			FrezeMEMWB_register <=1 ;
		end else begin 
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