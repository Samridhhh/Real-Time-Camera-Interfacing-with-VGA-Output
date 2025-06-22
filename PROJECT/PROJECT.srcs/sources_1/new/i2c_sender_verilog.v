`timescale 1ns/1ps
module i2c_sender_verilog (
    input clk,                   // System clock
    inout siod,                  // I2C data line (bidirectional)
    output sioc,                 // I2C clock line (output only)
    output reg taken,            // Indicates that send signal has been accepted
    input send,                  // Pulse to start transmission
    input [7:0] id,              // I2C slave device ID (7-bit address + R/W bit)
    input [7:0] rega,            // Register address
    input [7:0] value            // Data to be written to that register
);

    // State definitions using parameters (Verilog-2001 compatible)
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
    
    // Timing counters
    reg [7:0] clk_divider = 8'd0;
    reg [3:0] bit_counter = 4'd0;
    reg [7:0] current_byte = 8'd0;
    
    // I2C signal control
    reg sda_drive = 1'b0;        // 0: release (high-Z), 1: drive low
    reg scl_drive = 1'b0;        // 0: release (high-Z), 1: drive low
    
    // Proper I2C signal assignment - only drive low or high-impedance
    assign siod = sda_drive ? 1'b0 : 1'bz;
    
    // For sioc, make it a reg and drive it properly
    reg sioc_reg;
    assign sioc = sioc_reg; //giving connection
    
    // Clock divider for ~100kHz I2C clock from 100MHz system clock
    // Adjust for your actual system clock frequency
    parameter CLK_DIV = 8'd249;  // (100MHz / 400kHz) / 4 - 1 for quarter periods
    
    always @(posedge clk) begin
        taken <= 1'b0;
        
        case (state)
            IDLE: begin
                sda_drive <= 1'b0;  // Release SDA
                sioc_reg <= 1'b1;   // Release SCL (idle high)
                clk_divider <= 8'd0;
                bit_counter <= 4'd0;
                
                if (send) begin
                    state <= START;
                    taken <= 1'b1;
                end
            end
            
            START: begin
                if (clk_divider == 8'd0) begin
                    // Ensure bus is idle first
                    sda_drive <= 1'b0;  // Release SDA (should be high)
                    sioc_reg <= 1'b1;   // Release SCL (should be high)
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                    // Generate START: SDA high->low while SCL high
                    sda_drive <= 1'b1;  // Drive SDA low
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    sioc_reg <= 1'b0;   // Drive SCL low
                    current_byte <= id;   // Load device ID
                    bit_counter <= 4'd7; // Start with MSB
                    state <= SEND_ID;
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            SEND_ID, SEND_REG, SEND_VALUE: begin
                if (clk_divider == 8'd0) begin
                    // Setup data bit
                    sda_drive <= ~current_byte[bit_counter];  // 0=drive low, 1=release
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                    // Raise SCL
                    sioc_reg <= 1'b1;  // Release SCL
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    // Lower SCL
                    sioc_reg <= 1'b0;  // Drive SCL low
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 3)) begin
                    if (bit_counter == 4'd0) begin
                        // Move to ACK phase
                        sda_drive <= 1'b0;  // Release SDA for ACK
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
                    // Raise SCL to read ACK
                    sioc_reg <= 1'b1;  // Release SCL
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    // Sample ACK bit (should be low for ACK)
                    // In a robust implementation, you'd check siod here
                    sioc_reg <= 1'b0;  // Drive SCL low
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 3)) begin
                    // Prepare for next phase
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
                    // Ensure SDA is low before STOP
                    sda_drive <= 1'b1;  // Drive SDA low
                    sioc_reg <= 1'b0;   // Keep SCL low
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == CLK_DIV) begin
                    // Raise SCL first
                    sioc_reg <= 1'b1;  // Release SCL
                    clk_divider <= clk_divider + 1;
                end else if (clk_divider == (CLK_DIV * 2)) begin
                    // Generate STOP: SDA low->high while SCL high
                    sda_drive <= 1'b0;  // Release SDA
                    state <= STOP_WAIT;
                    clk_divider <= 8'd0;
                end else begin
                    clk_divider <= clk_divider + 1;
                end
            end
            
            STOP_WAIT: begin
                // Wait a bit before returning to IDLE
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