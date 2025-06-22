`timescale 1ns/1ps
    module vga (
    input clk25,                         // 25.175 MHz clock (use 25 MHz typically)
    output reg [3:0] vga_red,
    output reg [3:0] vga_green,
    output reg [3:0] vga_blue,
    output reg vga_hsync,
    output reg vga_vsync,
    output reg [18:0] frame_addr,        // Address into framebuffer (up to 640×480 = 307200)
    input [11:0] frame_pixel             // {Red[3:0], Green[3:0], Blue[3:0]}
);

    // VGA 640x480 @ 60Hz timing constants
    localparam H_DISPLAY  = 640;
    localparam H_FRONT    = 16;
    localparam H_SYNC     = 96;
    localparam H_BACK     = 48;
    localparam H_TOTAL    = H_DISPLAY + H_FRONT + H_SYNC + H_BACK;

    localparam V_DISPLAY  = 480;
    localparam V_FRONT    = 10;
    localparam V_SYNC     = 2;
    localparam V_BACK     = 33;
    localparam V_TOTAL    = V_DISPLAY + V_FRONT + V_SYNC + V_BACK;

    // Sync polarities
    localparam HSYNC_POL  = 1'b0;  // active low
    localparam VSYNC_POL  = 1'b0;  // active low

    // Horizontal and vertical counters
    reg [9:0] hCounter = 0;
    reg [9:0] vCounter = 0;

    // Address register pipeline
    reg [18:0] addr_reg = 0;
    reg [18:0] addr_next = 0;

    // Blanking flags
    reg blank = 1'b1;
    reg blank_d = 1'b1;

    // Sync generation registers
    reg hsync_reg = ~HSYNC_POL;
    reg vsync_reg = ~VSYNC_POL;

    // Horizontal and vertical counter logic
    always @(posedge clk25) begin
        if (hCounter == H_TOTAL - 1) begin
            hCounter <= 0;
            if (vCounter == V_TOTAL - 1)
                vCounter <= 0;
            else
                vCounter <= vCounter + 1;
        end else begin
            hCounter <= hCounter + 1;
        end
    end

    // Blanking and pixel address logic
    always @(posedge clk25) begin
        // Blanking: pixels outside visible area
        blank <= (hCounter >= H_DISPLAY) || (vCounter >= V_DISPLAY);

        // Generate framebuffer address
        if (vCounter >= V_DISPLAY)
            addr_reg <= 0;
        else if (hCounter < H_DISPLAY)
            addr_reg <= addr_reg + 1;

        // Delay to align frame pixel with pipeline
        blank_d <= blank;
        addr_next <= addr_reg;
    end

    // Pixel output logic
    always @(posedge clk25) begin
        frame_addr <= addr_next;

        if (!blank_d) begin
            vga_red   <= frame_pixel[11:8];
            vga_green <= frame_pixel[7:4];
            vga_blue  <= frame_pixel[3:0];
        end else begin
            vga_red   <= 4'd0;
            vga_green <= 4'd0;
            vga_blue  <= 4'd0;
        end
    end

    // Sync pulse generation
    always @(posedge clk25) begin
        // HSYNC
        if (hCounter >= (H_DISPLAY + H_FRONT) &&
            hCounter < (H_DISPLAY + H_FRONT + H_SYNC))
            hsync_reg <= HSYNC_POL;
        else
            hsync_reg <= ~HSYNC_POL;

     
        // VSYNC
        if (vCounter >= (V_DISPLAY + V_FRONT) &&
            vCounter < (V_DISPLAY + V_FRONT + V_SYNC))
            vsync_reg <= VSYNC_POL;
        else
            vsync_reg <= ~VSYNC_POL;

        // Output syncs
        vga_hsync <= hsync_reg;
        vga_vsync <= vsync_reg;
    end

endmodule