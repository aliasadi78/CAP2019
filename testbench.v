`timescale 1ns/1ns

module testbench ();
 	reg clk,rst;
  	Mips_Processor top_module (clk, rest);
        integer clk_tgl_period = 200;
        integer timeout = 1000;    
        initial begin
            clk <= '0;
            forever #(clk_tgl_period) clk = ~clk;
        end
        initial begin
            #(timeout) $finish ; 
        end
endmodule // test
