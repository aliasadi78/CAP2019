module IF2ID_Register(clk , rest , Flush , Freze ,Source_In ,Source_Out , PCPlus2_In , PCPlus2_Out);
	input clk , rest , Flush , Freze ;
	input [15:0] Source_In , PCPlus2_In ;
	output [15:0] Source_Out , PCPlus2_Out ;

	reg [15:0] Source_Out_register , PCPlus2_Out_register ;
	assign Source_Out = Source_Out_register ;
	assign PCPlus2_Out = PCPlus2_Out_register ;

	always @(posedge clk)begin 
		if (rest) begin 
			Source_Out_register <= 0 ;
			PCPlus2_Out_register <= 0 ;
		end else begin 
			if (!Freze) begin 
				if(Flush)begin 
					Source_Out_register <= 0 ;
					PCPlus2_Out_register <= 0 ;
				end else begin 
					Source_Out_register <= Source_In ;
					PCPlus2_Out_register <= PCPlus2_In ;
				end
			end
		end
	end

endmodule 