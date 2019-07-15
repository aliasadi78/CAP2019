module BranchTaken(rest , IDEXOp_Code , CompareFlag , SR_Flag , Branch , brTaken);
	input rest , CompareFlag , SR_Flag , Branch; 
	input [3:0] IDEXOp_Code ;
	output brTaken ;

	reg brTaken_register ;
	assign brTaken = brTaken ;
	initial begin
		brTaken_register <= 0 ;
	end
	always @(rest or CompareFlag or SR_Flag or IDEXOp_Code) begin 
		if (rest) begin 
			brTaken_register <= 0 ;
		end else begin 
			if (IDEXOp_Code == 4'b1101) begin 
				if(Branch && !CompareFlag)
					brTaken_register <=1 ;
				else
					brTaken_register <= 0 ;
			end else begin 
				if(Branch && !SR_Flag)
					brTaken_register <=1 ;
				else
					brTaken_register <= 0 ;
			end
		end 
	end 
endmodule 