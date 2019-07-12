module Controller( Op_Code, Controll_Signals);
	input wire [3:0] Op_Code ;
	output [15:0] Controll_Signals ; 
	//[
	
	reg [15:0] Controll_Signals_register ; 

	assign Controll_Signals = Controll_Signals_register;

	always @(Op_Code) begin
		if(Op_Code == 4'b0001 || Op_Code == 4'b0100 || Op_Code == 4'b0111 || Op_Code == 4'b1000 || Op_Code == 4'b1001 || Op_Code == 4'b1010)
			Controll_Signals_register[15] <= 1;
		else 
			Controll_Signals_register[15] <= 0;

		if(Op_Code == 4'b0011 || Op_Code == 4'b0110 || Op_Code == 4'b1000 || Op_Code == 4'b1001 || Op_Code == 4'b1010)
			Controll_Signals_register[14:13] <= 0;
		else if (Op_Code == 4'b0000 || Op_Code == 4'b0010 || Op_Code == 4'b0100 || Op_Code == 4'b0101 || Op_Code == 4'b1101) 
			Controll_Signals_register[14:13] <= 2;
		else 
			Controll_Signals_register[14:13] <= 1;

		if(Op_Code == 4'b0001 || Op_Code == 4'b0111 || Op_Code == 4'b1000 || Op_Code == 4'b1010)
			Controll_Signals_register[12] <= 1;
		else 
			Controll_Signals_register[12] <= 0;

		if(Op_Code == 4'b1001)
			Controll_Signals_register[11] <= 1;
		else 
			Controll_Signals_register[11] <= 0;

		if(Op_Code == 4'b1001 || Op_Code == 4'b1010 || Op_Code == 4'b1111 || Op_Code == 4'b0100 || Op_Code == 4'b1101 || Op_Code == 4'b1110)
			Controll_Signals_register[10] <= 0;
		else 
			Controll_Signals_register[10] <= 1;	

		//Aluop
		if(Op_Code == 4'b0010)
			Controll_Signals_register[9:7] <= 2 ;
		else if(Op_Code == 4'b0100)
			Controll_Signals_register[9:7] <= 6 ;
		else if (Op_Code == 4'b0101)
			Controll_Signals_register[9:7] <= 3 ;
		else if (Op_Code == 4'b0110)
			Controll_Signals_register[9:7] <= 5 ;
		else if(Op_Code == 4'b1011)
			Controll_Signals_register[9:7] <= 0 ;
		else if(Op_Code == 4'b1100)
			Controll_Signals_register[9:7] <= 4 ;
		else if (Op_Code == 4'b1101)
			Controll_Signals_register[9:7] <= 7 ;
		else 
			Controll_Signals_register[9:7] <= 1 ;

		if(Op_Code == 4'b1110)
			Controll_Signals_register[6] <= 1;
		else 
			Controll_Signals_register[6] <= 0;

		if(Op_Code == 4'b1000)
			Controll_Signals_register[5] <= 1;
		else 
			Controll_Signals_register[5] <= 0;

		if(Op_Code == 4'b1010)
			Controll_Signals_register[4] <= 1;
		else 
			Controll_Signals_register[4] <= 0;

		if(Op_Code == 4'b0001)
			Controll_Signals_register[3] <= 1;
		else 
			Controll_Signals_register[3] <= 0;


		if(Op_Code == 4'b1000 || Op_Code == 4'b0111)
			Controll_Signals_register[2:1] <= 0;
		else if (Op_Code == 4'b0001)
			Controll_Signals_register[2:1] <= 2;
		else 
			Controll_Signals_register[2:1] <= 1;

		if (Op_Code == 4'b1111)
			Controll_Signals_register[0] <=1 ;
		else 
			Controll_Signals_register <= 0 ;
	end 
endmodule 