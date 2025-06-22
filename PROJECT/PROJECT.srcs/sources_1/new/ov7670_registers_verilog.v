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
                0  : command <= 16'h1280; // COM7: Reset
                1  : command <= 16'h1204; // COM7: RGB output
                2  : command <= 16'h8C00; // RGB444: disable
                3  : command <= 16'h4000; // COM15: clear
                4  : command <= 16'h40D0; // COM15: RGB565, full-range
                5  : command <= 16'h3A04; // TSLB: set UV ordering

                // ✅ Enable AWB, AEC, AGC
                6  : command <= 16'h13E7; // COM8: enable AGC, AEC, AWB

                // ✅ Clock control
                7  : command <= 16'h1101; // CLKRC

                // ✅ Gain tuning (white balance)
                8  : command <= 16'h01A0; // BLUE gain
                9  : command <= 16'h02A0; // RED gain

                // ✅ Gamma, UV adjust off to avoid reddish hue
                10 : command <= 16'h3DC0; // COM13: Gamma, UV auto OFF

                // ✅ Matrix coefficients (RGB color balance)
                11 : command <= 16'h4F80;
                12 : command <= 16'h5080;
                13 : command <= 16'h5100;
                14 : command <= 16'h5232;
                15 : command <= 16'h53DF;
                16 : command <= 16'h5410;
                17 : command <= 16'h589E;

                // ✅ Window and frame timing for 640x480 VGA
                18 : command <= 16'h1711;
                19 : command <= 16'h1861;
                20 : command <= 16'h32A4;
                21 : command <= 16'h1903;
                22 : command <= 16'h1A7B;
                23 : command <= 16'h030A;

                // ✅ Flip and mirror
                24 : command <= 16'h1E07; // MVFP: no flip/mirror

                // ✅ Saturation and contrast
                25 : command <= 16'h5580; // BRIGHT: neutral
                26 : command <= 16'h5640; // CONTRAST

                // ✅ COM14 (PCLK divider and scaling)
                27 : command <= 16'h3E00;

                // Optional: disable test pattern
                28 : command <= 16'h3B00;
                
                29 : command <= 16'h3F00;
                30 :command <= 16'h4CFF;   // Set DNSTH to 0xFF
                31 : command <=16'hC940;
                
                32 :    command <= 16'h7B10; // GAM1: brighten shadows
                33 :    command <= 16'h7C20; // GAM2: brighten low midtones
                34 :    command <= 16'h7A40; // SLOP: increase gamma slope
    
    
                    default: begin 
                    command  <= 16'hFFFF;
                    finished <= 1'b1;
                end
            endcase
        end
    end
endmodule