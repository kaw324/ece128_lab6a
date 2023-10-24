`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 14:20:21
// Design Name: 
// Module Name: BCD_tb
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


//module BCD_tb();

//    reg clk;
//    reg en;
//    reg [3:0] in1;
//    reg [3:0] in2;
//    reg carry_in;
//    wire [15:0] bcd_d_out;

//    // Generate a clock signal
//    always begin
//        #1 clk = ~clk;
//    end

//    // Instantiate the design under test (DUT)
//    top dut(
//        .clk(clk),
//        .en(en),
//        .in1(in1),
//        .in2(in2),
//        .carry_in(carry_in),
//        .bcd_d_out(bcd_d_out)
//    );

//    initial begin
//        // Initialization
//        clk = 1;
//        en = 1;
//        in1 = 4'b1111; // 15 in binary
//        in2 = 4'b1110; // 14 in binary
//        carry_in = 0;


//   in1 = 1; in2 = 0; carry_in = 0; #10;
//    in1 = 2; in2 = 4; carry_in = 1; #10;
//    in1 = 4'hb; in2 = 4'h6; carry_in = 0; #10;
//    in1 = 5; in2 = 3; carry_in = 1;#10



//        // Apply stimulus
//       #10 en = 1;   // Enable the operation
//       // #20 en = 1;  // Disable after some cycles
//         $stop;   // Stop the simulation
//    end


//endmodule

module BCD_tb(

    );

reg clk = 0;
reg en;// = 0;
reg [11:0] bin_d_in = 0;
wire [15:0] bcd_d_out;
wire rdy;

// 2. Instantiate the design and connect to testbench variables
bin2BCD fa0(
.clk(clk),
.en(en),
.bin_d_in(bin_d_in),
.bcd_d_out(bcd_d_out),
.rdy(rdy)

);

initial
begin
//clk = 0;
forever
begin
#10 clk = ~clk; //10*2 for full wave
end
end

initial
begin
forever
begin
bin_d_in = 0;
en = 1;
#20 //en must catch rising edge of clk
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = 12'b111111111111;// 2^(12)-1 = 4095 = 0xfff
en = 1;
#20
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = 0;
en = 1;
#20
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 1;
en = 1;
#20
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 10;
en = 1;
#20
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 10;
en = 1;
#20
en = 0;
#620; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enableback to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 100;
en = 1;

#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 1000;
en = 1;
#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 1000;
en = 1;
#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 1;
en = 1;
#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 2;
en = 1;
#20
en = 0;

#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 2;
en = 1;
#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340

bin_d_in = bin_d_in + 5;
en = 1;
#20
en = 0;
#1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4);enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340
end
end
endmodule



