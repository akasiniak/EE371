// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"
// CREATED		"Tue Jan 16 13:54:59 2018"

module synchronousCounterSchematic(
	reset,
	clk,
	count0,
	count1,
	count2,
	count3
);


input wire	reset;
input wire	clk;
output wire	count0;
output wire	count1;
output wire	count2;
output wire	count3;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;

assign	count0 = SYNTHESIZED_WIRE_24;
assign	count1 = SYNTHESIZED_WIRE_23;
assign	count2 = SYNTHESIZED_WIRE_25;
assign	count3 = SYNTHESIZED_WIRE_17;




DFlipFlop	b2v_inst(
	.D(SYNTHESIZED_WIRE_0),
	.clk(SYNTHESIZED_WIRE_22),
	.rst(reset),
	.q(SYNTHESIZED_WIRE_24)
	);


DFlipFlop	b2v_inst1(
	.D(SYNTHESIZED_WIRE_2),
	.clk(SYNTHESIZED_WIRE_22),
	.rst(reset),
	.q(SYNTHESIZED_WIRE_23)
	);

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_25 | SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_24 ~^ SYNTHESIZED_WIRE_23;


DFlipFlop	b2v_inst2(
	.D(SYNTHESIZED_WIRE_11),
	.clk(SYNTHESIZED_WIRE_22),
	.rst(reset),
	.q(SYNTHESIZED_WIRE_25)
	);


DFlipFlop	b2v_inst3(
	.D(SYNTHESIZED_WIRE_13),
	.clk(SYNTHESIZED_WIRE_22),
	.rst(reset),
	.q(SYNTHESIZED_WIRE_17)
	);

assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_21 =  ~SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_19 =  ~SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_18 ^ SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_20 ^ SYNTHESIZED_WIRE_21;


clockDivider	b2v_inst9(
	.clkIn(clk),
	.clkOut(SYNTHESIZED_WIRE_22));


endmodule
