`timescale 1ns / 1ps
module clocking_verilog(
 input clk_in,reset,
 output reg clk_out
 );
 
    always @ (posedge clk_in)
        begin
            if(reset)
                clk_out <= 1'b0;
                
            else
            clk_out <= ~clk_out ; 
        end
endmodule
