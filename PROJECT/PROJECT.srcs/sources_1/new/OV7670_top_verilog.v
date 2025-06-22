`timescale 1ns/1ps

module OV7670_top_verilog (
    input clk100,
    output OV7670_SIOC,
    inout  OV7670_SIOD,
    output OV7670_RESET,
    output OV7670_PWDN,
    input  OV7670_VSYNC,
    input  OV7670_HREF,
    input  OV7670_PCLK,
    output OV7670_XCLK,
    input  [7:0] OV7670_D,
    output led,
    output [3:0] vga_red,
    output [3:0] vga_green,
    output [3:0] vga_blue,
    output vga_hsync,
    output vga_vsync,
    input btn,
    input rst,
    input reset_cam
);

    wire [18:0] frame_addr;
    wire [11:0] frame_pixel;

    wire [18:0] capture_addr;
    wire [11:0] capture_data;
    wire capture_we;

    wire resend;
    wire config_finished;

    wire clk50;
    wire clk25;


    debounce db1 (
        .clk(clk50),
        .i(btn),
        .o(resend)
    );

   
    vga vg1 (
        .clk25(clk25),
        .vga_red(vga_red),
        .vga_green(vga_green),
        .vga_blue(vga_blue),
        .vga_hsync(vga_hsync),
        .vga_vsync(vga_vsync),
        .frame_addr(frame_addr),
        .frame_pixel(frame_pixel)
    );

    
    blk_mem_gen_0 fb1 (
        .ena(1'b1),
        .enb(1'b1),
        .clka(OV7670_PCLK),
        .wea(capture_we),
        .addra(capture_addr),
        .dina(capture_data),
        .clkb(clk50),
        .addrb(frame_addr),
        .doutb(frame_pixel)
    );

   
    ov7670_capture_verilog cap1 (
        .pclk(OV7670_PCLK),
        .vsync(OV7670_VSYNC),
        .href(OV7670_HREF),
        .d(OV7670_D),
        .addr(capture_addr),
        .dout(capture_data),
        .we(capture_we)
    );

   
    ov7670_controller_verilog con1 (
        .clk(clk50),
        .resend(resend),
        .reset_cam(reset_cam),
        .config_finished(config_finished),
        .sioc(OV7670_SIOC),
        .siod(OV7670_SIOD),
        .reset(OV7670_RESET),
        .pwdn(OV7670_PWDN),
        .xclk(OV7670_XCLK),
        .led(led)
    );

   
    clocking_verilog clk1 (.clk_in(clk100), .clk_out(clk50), .reset(rst));
    clocking_verilog clk2 (.clk_in(clk50),  .clk_out(clk25), .reset(rst));

endmodule