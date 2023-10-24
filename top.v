`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 00:59:05
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input en,
    input [3:0] in1, // Inputs for the CLA
    input [3:0] in2,
    input carry_in,
    output [15:0] bcd_d_out
);

    // Outputs of the CLA
    wire [3:0] sum;
    wire carry_out;

    // 12-bit signal to feed into bin2BCD
    wire [11:0] in_sig;

    // Instantiate CLA
    lab5_1 cla_inst(
        .in1(in1),
        .in2(in2),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    // Form the 12-bit signal for bin2BCD
    assign in_sig = {7'b0, carry_out, sum};

    // Instantiate bin2BCD
    bin2BCD bcd_inst(
        .clk(clk),
        .en(en),
        .bin_d_in(in_sig),
        .bcd_d_out(bcd_d_out)
    );

endmodule


