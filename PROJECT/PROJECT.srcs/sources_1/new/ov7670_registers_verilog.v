`timescale 1ns/1ps
module ov7670_registers_verilog (
    input clk,
    input resend,
    input advance,
    output reg [15:0] command,
    output reg finished
);

    reg [7:0] address = 8'd0;

    always @(posedge clk) begin
        if (resend) begin
            address  <= 8'd0;
            finished <= 1'b0;
        end 
        else if (advance && !finished) begin
            address <= address + 1;
        end

        if (resend || (advance && !finished)) begin
            case (address)
                0  : command <= 16'h1280; 
                1  : command <= 16'h1204; 
                2  : command <= 16'h8C00; 
                3  : command <= 16'h4000; 
                4  : command <= 16'h40D0; 
                5  : command <= 16'h3A04; 
                6  : command <= 16'h13E7; 
                7  : command <= 16'h1101; 
                8  : command <= 16'h01A0;
                9  : command <= 16'h02A0; 
                10 : command <= 16'h3DC0; 
                11 : command <= 16'h4F80;
                12 : command <= 16'h5080;
                13 : command <= 16'h5100;
                14 : command <= 16'h5232;
                15 : command <= 16'h53DF;
                16 : command <= 16'h5410;
                17 : command <= 16'h589E;
                18 : command <= 16'h1711;
                19 : command <= 16'h1861;
                20 : command <= 16'h32A4;
                21 : command <= 16'h1903;
                22 : command <= 16'h1A7B;
                23 : command <= 16'h030A;
                24 : command <= 16'h1E07; 
                25 : command <= 16'h5580; 
                26 : command <= 16'h5640;
                27 : command <= 16'h3E00;
                28 : command <= 16'h3B00;
                29 : command <= 16'h3F00;
                30 :command <= 16'h4CFF;   
                31 : command <=16'hC940;
                32 : command <= 16'h7B10; 
                33 : command <= 16'h7C20; 
                34 : command <= 16'h7A40; 
                    default: begin 
                    command  <= 16'hFFFF;
                    finished <= 1'b1;
                end
            endcase
        end
    end
endmodule
