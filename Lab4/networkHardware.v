`include "p2s.v"
`include "s2p.v"
`include "startBitDetect.v"
`include "bitSampleCount.v"
`include "bitIdentifierCount.v"
`include "bitIdentifierCountReceive.v"
module networkHardware(reset, clk, transmitEnable, parallelDataOut, load, parallelDataIn, characterReceived, characterSent, serialDataIn, serialDataOut);
	input wire reset, clk;
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

	bitIdentifierCount outDataBIC(characterSent, transmitEnable, BSCClockOut, bitCountOut, clk, reset);
	bitSampleCount outDataBSC(BSCClockOut, transmitEnable, clk, reset);
	p2s dataOut(serialDataOut, parallelDataOut, load, BSCClockOut, reset);
	
	s2p dataIn(parallelDataIn, serialDataIn, characterReceived, reset, BSCClockIn);
	bitIdentifierCount inDataBIC(characterReceived, startBitDetected, BSCClockIn, bitCountIn, clk, reset);
	bitSampleCount inDataBSC(BSCClockIn, startBitDetected, clk, reset);
	startBitDetect detector(startBitDetected, characterReceived, serialDataIn, bitCountIn, clk, reset);
endmodule

module networkHardware_testbench;
	reg reset;	
	reg clk;
	reg serialDataIn;
	wire serialDataOut;
	reg [7:0] parallelDataOut;
	reg transmitEnable;
	reg load;
	wire characterReceived, characterSent;
 	wire [7:0] parallelDataIn;
 	reg nClk;

 	networkHardware dut(reset, clk, transmitEnable, parallelDataOut, load, parallelDataIn, characterReceived, characterSent, serialDataIn, serialDataOut); 
 	always@(posedge clk) begin
 		serialDataIn <= serialDataOut;
 	end
 	parameter ClockDelay = 2;
  	initial begin //setup the clock
    	clk <= 0;
    	forever begin
      		#(ClockDelay/2);
      		clk <= ~clk;
      	end
  	end
  	integer i;
  	initial begin
	   $dumpfile("networkHardware.vcd");
	   $dumpvars(1,dut);
	   reset <= 1'b0;
	   serialDataIn <= 1'b1;
	   transmitEnable <= 1'b0;
	   load <= 1'b0;
	   parallelDataOut <= 8'd0;
	   #ClockDelay;
	   reset <= 1'b1;
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
	   load <= 1'b0;
	   #ClockDelay;
	   transmitEnable <= 1'b1;
	   parallelDataOut <= 8'b10101010;
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