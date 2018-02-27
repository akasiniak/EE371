`include "p2s.v"
`include "s2p.v"
`include "startBitDetect.v"
`include "bitSampleCount.v"
`include "bitIdentifierCount.v"
`include "bitIdentifierCountReceive.v"
module networkHardware(LEDR, SW, KEY, CLOCK_50, transmitEnable, parallelDataOut, load, parallelDataIn, characterReceived, characterSent, serialDataIn, serialDataOut);
	output reg [9:0] LEDR;
	input wire [9:0] SW;
	input wire [2:0] KEY;
	input wire CLOCK_50;
	input wire serialDataIn;
	output wire serialDataOut;
	input wire [7:0] parallelDataOut;
	input wire transmitEnable;
	input wire load;
	output wire characterReceived, characterSent;
	output wire [7:0] parallelDataIn;
	wire BSCClockOut, BSCClockIn;
	wire startBitDetected;
	wire [3:0] bitCountIn, bitCountOut;

	bitIdentifierCount outDataBIC(characterSent, transmitEnable, BSCClockOut, bitCountOut, CLOCK_50, ~KEY[0]);
	bitSampleCount outDataBSC(BSCClockOut, transmitEnable, CLOCK_50, ~KEY[0]);
	p2s dataOut(serialDataOut, parallelDataOut, load, BSCClockOut, ~KEY[0]);
	
	s2p dataIn(parallelDataIn, serialDataIn, characterReceived, ~KEY[0], BSCClockIn);
	bitIdentifierCount inDataBIC(characterReceived, startBitDetected, BSCClockIn, bitCountIn, CLOCK_50, ~KEY[0]);
	bitSampleCount inDataBSC(BSCClockIn, startBitDetected, CLOCK_50, ~KEY[0]);
	startBitDetect detector(startBitDetected, characterReceived, serialDataIn, bitCountIn, CLOCK_50, ~KEY[0]);
endmodule

module networkHardware_testbench;
	wire [9:0] LEDR;
	reg [9:0] SW;
	reg [2:0] KEY;
	reg CLOCK_50;
	reg serialDataIn;
	wire serialDataOut;
	reg [7:0] parallelDataOut;
	reg transmitEnable;
	reg load;
	wire characterReceived, characterSent;
 	wire [7:0] parallelDataIn;
 	reg nClk;

 	networkHardware dut(LEDR, SW, KEY, CLOCK_50, transmitEnable, parallelDataOut, load, parallelDataIn, characterReceived, characterSent, serialDataIn, serialDataOut); 
 	always@(posedge CLOCK_50) begin
 		serialDataIn <= serialDataOut;
 	end
 	parameter ClockDelay = 2;
  	initial begin //setup the clock
    	CLOCK_50 <= 0;
    	forever begin
      		#(ClockDelay/2);
      		CLOCK_50 <= ~CLOCK_50;
      	end
  	end
  	integer i;
  	initial begin
	   $dumpfile("networkHardware.vcd");
	   $dumpvars(1,dut);
	   KEY[0] <= 1'b0;
	   serialDataIn <= 1'b1;
	   transmitEnable <= 1'b0;
	   load <= 1'b0;
	   parallelDataOut <= 8'd0;
	   #ClockDelay;
	   KEY[0] <= 1'b1;
	   #ClockDelay;
	   $display("beginning transmission at: %d", $time);
	   transmitEnable <= 1'b1;
	   parallelDataOut <= 8'b01010101;
	   load <= 1'b1;
	   #ClockDelay;
	   for(i = 0; i < 176; i++) begin
	   	#ClockDelay;
	   end
	   transmitEnable <= 1'b0;
	   #ClockDelay;
	   $finish;
	end
endmodule