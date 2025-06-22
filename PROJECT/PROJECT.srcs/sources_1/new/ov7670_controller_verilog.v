`timescale 1ns/1ps
module ov7670_controller_verilog(
    input        clk,             // System clock (e.g. 50MHz)
    input        resend,          // Manual re-configure trigger
    input        reset_cam,       // Active-low system reset
    output       config_finished, // High when config done
    output       sioc,            // I2C clock to camera
    inout        siod,            // I2C data to/from camera
    output       reset,           // Camera reset (active high)
    output       pwdn,            // Camera power-down (active high)
    output       xclk,            // Camera clock (24/25MHz)
    output reg   led              // LED output: ON when config finished
);

    // I2C device address for OV7670 (write)
    reg [7:0] camera_address = 8'h42;

    // Internal signals
    wire [15:0] command;
    wire        finished;
    wire        taken;
    reg         send;
    reg         finished_d;

    // Assign camera control signals
    assign reset = 1'b1;   // Keep camera out of reset
    assign pwdn  = 1'b0;   // Keep powered up
    assign config_finished = finished;

    // Generate camera xclk (e.g., 25 MHz from 50 MHz input)
    reg sys_clk = 1'b0;
    always @(posedge clk) begin
        if (!reset_cam)
            sys_clk <= 1'b0;
        else
            sys_clk <= ~sys_clk;
    end
    assign xclk = sys_clk;

    // Generate 1-cycle pulse on rising edge of 'finished'
    always @(posedge clk) begin
        if (!reset_cam) begin
            finished_d <= 0;
            send <= 0;
        end else begin
            finished_d <= finished;
            send <= ~finished & finished_d; // pulse after each finished
        end
    end

    // LED logic: ON when configuration completes
    always @(posedge clk) begin
        if (!reset_cam)
            led <= 1'b0;
        else if (finished)
            led <= 1'b1;
    end

    // Camera register controller
    ov7670_registers_verilog orv (
        .clk(clk),
        .advance(taken),
        .command(command),
        .finished(finished),
        .resend(resend)
    );

    // I2C transmitter
    i2c_sender_verilog isv (
        .clk(clk),
        .taken(taken),
        .siod(siod),
        .sioc(sioc),
        .send(send),
        .id(camera_address),
        .rega(command[15:8]),
        .value(command[7:0])
    );

endmodule