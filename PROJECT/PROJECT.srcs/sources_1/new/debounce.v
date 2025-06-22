`timescale 1ns/1ps
module debounce #(
    parameter DEBOUNCE_CYCLES = 1_000_000 // ~20ms at 50MHz
)(
    input clk,
    input i,
    output reg o
);


    reg [1:0] sync = 2'b00;
    always @(posedge clk) begin
        sync <= {sync[0], i};
    end

    
    reg [19:0] counter = 0;
    reg stable = 0;

    always @(posedge clk) begin
        if (sync[1] != stable) begin
            if (counter < DEBOUNCE_CYCLES)
                counter <= counter + 1;
            else begin
                stable <= sync[1];  
                o <= sync[1];
                counter <= 0;
            end
        end else begin
            counter <= 0; 
        end
    end

endmodule