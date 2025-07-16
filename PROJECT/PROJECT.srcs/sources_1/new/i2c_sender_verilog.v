`timescale 1ns/1ps
module i2c_sender_verilog (
    input clk,                  
    inout siod,                  
    output sioc,                 
    output reg taken,           
    input send,                 
    input [7:0] id,             
    input [7:0] rega,           
    input [7:0] value           
);

    parameter [4:0] IDLE          = 5'b00000;
    parameter [4:0] START         = 5'b00001;
    parameter [4:0] SEND_ID       = 5'b00010;
    parameter [4:0] WAIT_ACK_ID   = 5'b00011;
    parameter [4:0] SEND_REG      = 5'b00100;
    parameter [4:0] WAIT_ACK_REG  = 5'b00101;
    parameter [4:0] SEND_VALUE    = 5'b00110;
    parameter [4:0] WAIT_ACK_VALUE= 5'b00111;
    parameter [4:0] STOP          = 5'b01000;
    parameter [4:0] STOP_WAIT     = 5'b01001;
    
    reg [4:0] state = IDLE;
    
    reg [7:0] clk_divider = 8'd0;
    reg [3:0] bit_counter = 4'd0;
    reg [7:0] current_byte = 8'd0;
    
    reg sda_drive = 1'b0;       
    reg scl_drive = 1'b0;       
    
   
    assign siod = sda_drive ? 1'b0 : 1'bz;
    
   
    reg sioc_reg;
    assign sioc = sioc_reg;
    
  
    parameter CLK_DIV = 8'd249; 
    
    always @(posedge clk) begin
        taken <= 1'b0;
        
        case (state)
            IDLE: begin
                sda_drive <= 1'b0; 
                sioc_reg <= 1'b1;   
                clk_divider <= 8'd0;
                bit_counter <= 4'd0;
                
                if (send) begin
                    state <= START;
                    taken <= 1'b1;
                end
            end
            
            START: begin
                if (clk_divider == 8'd0) begin
                   
                    sda_drive <= 1'b0; 
                    sioc_reg <= 1'b1;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                   
                    sda_drive <= 1'b1;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    sioc_reg <= 1'b0;  
                    current_byte <= id;   
                    bit_counter <= 4'd7; 
                    state <= SEND_ID;
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            SEND_ID, SEND_REG, SEND_VALUE: begin
                if (clk_divider == 8'd0) begin
                   
                    sda_drive <= ~current_byte[bit_counter];  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                  
                    sioc_reg <= 1'b1; 
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                   
                    sioc_reg <= 1'b0;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 3)) begin
                    if (bit_counter == 4'd0) begin
                      
                        sda_drive <= 1'b0; 
                        if (state == SEND_ID) 
                            state <= WAIT_ACK_ID;
                        else if (state == SEND_REG) 
                            state <= WAIT_ACK_REG;
                        else 
                            state <= WAIT_ACK_VALUE;
                    end else begin
                        bit_counter <= bit_counter - 1;
                    end
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            WAIT_ACK_ID, WAIT_ACK_REG, WAIT_ACK_VALUE: begin
                if (clk_divider == CLK_DIV) begin
                  
                    sioc_reg <= 1'b1;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    sioc_reg <= 1'b0;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 3)) begin
                    if (state == WAIT_ACK_ID) begin
                        current_byte <= rega;
                        bit_counter <= 4'd7;
                        state <= SEND_REG;
                    end else if (state == WAIT_ACK_REG) begin
                        current_byte <= value;
                        bit_counter <= 4'd7;
                        state <= SEND_VALUE;
                    end else begin
                        state <= STOP;
                    end
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            STOP: begin
                if (clk_divider == 8'd0) begin
                    
                    sda_drive <= 1'b1; 
                    sioc_reg <= 1'b0;  
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                    sioc_reg <= 1'b1; 
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    sda_drive <= 1'b0; 
                    state <= STOP_WAIT;
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            STOP_WAIT: begin
                if (clk_divider == CLK_DIV) begin
                    state <= IDLE;
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            default: state <= IDLE;
        endcase
    end
    
endmodule
