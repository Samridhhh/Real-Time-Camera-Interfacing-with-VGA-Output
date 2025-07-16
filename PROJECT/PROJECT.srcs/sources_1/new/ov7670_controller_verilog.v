`timescale 1ns/1ps
module ov7670_controller_verilog(
    input        clk,             
    input        resend,          
    input        reset_cam,      
    output       config_finished, 
    output       sioc,            
    inout        siod,           
    output       reset,           
    output       pwdn,            
    output       xclk,            
    output reg   led             
);

    
    reg [7:0] camera_address = 8'h42;
    wire [15:0] command;
    wire        finished;
    wire        taken;
    reg         send;
    reg         finished_d;

   
    assign reset = 1'b1;   
    assign pwdn  = 1'b0;   
    assign config_finished = finished;
    reg sys_clk = 1'b0;
    
    always @(posedge clk) begin
        if (!reset_cam)
            sys_clk <= 1'b0;
        else
            sys_clk <= ~sys_clk;
    end
    assign xclk = sys_clk;

  
    always @(posedge clk) begin
        if (!reset_cam) begin
            finished_d <= 0;
            send <= 0;
        end else begin
            finished_d <= finished;
            send <= ~finished & finished_d; 
        end
    end

   
    always @(posedge clk) begin
        if (!reset_cam)
            led <= 1'b0;
        else if (finished)
            led <= 1'b1;
    end

   
    ov7670_registers_verilog orv (
        .clk(clk),
        .advance(taken),
        .command(command),
        .finished(finished),
        .resend(resend)
    );

  
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
