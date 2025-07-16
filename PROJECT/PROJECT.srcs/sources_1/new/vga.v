`timescale 1ns/1ps
    module vga (
    input clk25,                        
    output reg [3:0] vga_red,
    output reg [3:0] vga_green,
    output reg [3:0] vga_blue,
    output reg vga_hsync,
    output reg vga_vsync,
    output reg [18:0] frame_addr,       
    input [11:0] frame_pixel             
);
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
    localparam HSYNC_POL  = 1'b0; 
    localparam VSYNC_POL  = 1'b0; 

   
    reg [9:0] hCounter = 0;
    reg [9:0] vCounter = 0;

   
    reg [18:0] addr_reg = 0;
    reg [18:0] addr_next = 0;

   
    reg blank = 1'b1;
    reg blank_d = 1'b1;

   
    reg hsync_reg = ~HSYNC_POL;
    reg vsync_reg = ~VSYNC_POL;

   
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

   
    always @(posedge clk25) begin
       
        blank <= (hCounter >= H_DISPLAY) || (vCounter >= V_DISPLAY);

      
        if (vCounter >= V_DISPLAY)
            addr_reg <= 0;
        else if (hCounter < H_DISPLAY)
            addr_reg <= addr_reg + 1;

      
        blank_d <= blank;
        addr_next <= addr_reg;
    end

  
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

   
    always @(posedge clk25) begin
       
        if (hCounter >= (H_DISPLAY + H_FRONT) &&
            hCounter < (H_DISPLAY + H_FRONT + H_SYNC))
            hsync_reg <= HSYNC_POL;
        else
            hsync_reg <= ~HSYNC_POL;

     
      
        if (vCounter >= (V_DISPLAY + V_FRONT) &&
            vCounter < (V_DISPLAY + V_FRONT + V_SYNC))
            vsync_reg <= VSYNC_POL;
        else
            vsync_reg <= ~VSYNC_POL;

      
        vga_hsync <= hsync_reg;
        vga_vsync <= vsync_reg;
    end

endmodule
