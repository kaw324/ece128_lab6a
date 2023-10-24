`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 12:50:50
// Design Name: 
// Module Name: lab5_1
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


module lab5_1 (
    input [3:0] in1,
    input [3:0] in2,
    input carry_in,
    output [3:0] sum,
    output carry_out
);

wire [3:0] gen;
wire [3:0] pro;
wire [4:0] carry_tmp;

genvar i;

generate
    // Assume carry_tmp in is zero
    assign carry_tmp[0] = carry_in;

    // Carry generator
    for(i = 0; i < 4; i = i + 1) begin: carry_generator
        assign gen[i] = in1[i] & in2[i];
        assign pro[i] = in1[i] ^ in2[i];  // This should be XOR for propagate
        assign carry_tmp[i+1] = gen[i] | pro[i] & carry_tmp[i];
    end

    // Carry out 
    assign carry_out = carry_tmp[4];

    // Calculate sum 
    for(i = 0; i < 4; i = i + 1) begin: sum_without_carry
        assign sum[i] = in1[i] ^ in2[i] ^ carry_tmp[i];
    end
endgenerate 

endmodule 

