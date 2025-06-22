`timescale 1ns/1ps
module ov7670_capture_verilog (
    input pclk,
    input vsync,
    input href,
    input [7:0] d,
    output reg [18:0] addr,
    output reg [11:0] dout,
    output reg we
);

    reg [15:0] d_latch = 16'd0;
    reg byte_toggle = 1'b0;       // Toggle between high and low byte
    reg [18:0] address_next = 0;

    always @(posedge pclk) begin
        if (vsync) begin
            addr         <= 0;
            address_next <= 0;
            byte_toggle  <= 0;
            we           <= 0;
        end 
        else if (href) begin
            byte_toggle <= ~byte_toggle;

            if (!byte_toggle) begin
                d_latch[15:8] <= d; // First byte (MSB)
                we <= 0;
            end 
            else begin
                d_latch[7:0] <= d;  // Second byte (LSB)
                
                // Convert RGB565 to RGB444
                dout <= {
                    d_latch[14:11],  // R[4:1]
                    d_latch[9:7],1'b0,   // G[5:2]
                    d_latch[4:1]    // B[4:1]
                };

                addr <= address_next;
                address_next <= address_next + 1;

                we <= 1;
            end
        end 
        else begin
            we <= 0; // No write outside href
        end
    end
endmodule