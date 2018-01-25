//1 means open, 0 means closed
module outerDoor(doorState, commandSwitch, innerDoorState, pressurized, reset, clk);
  input wire commandSwitch, innerDoorState, reset, pressurized, clk;
  output reg doorState;
  always @(posedge clk) begin
    if(!reset) begin
      doorState <= 1'b0;
    end else begin
      if(commandSwitch) begin //trying to open the outer door
        if(pressurized && !innerDoorState) begin //can only do it if chamber is pressurized and inner door is closed
          doorState <= 1'b1;
        end
      end else begin
        doorState <= 1'b0; //close the door
      end
    end
  end
endmodule

/*module outerDoor_testbench;
  reg clk, reset, commandSwitch, innerDoorState, pressurized;
  wire doorState;
  outerDoor dut (doorState, commandSwitch, innerDoorState, pressurized, reset, clk);
  parameter ClockDelay = 2;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay/2);
      clk <= ~clk;
    end
  end
  initial begin //begin testing
    $dumpfile("outerDoor.vcd");
    $dumpvars(1,dut);
    reset = 1'b0; #ClockDelay;
    reset = 1'b1; #ClockDelay;
    commandSwitch = 1'b1;
    pressurized = 1'b0;
    innerDoorState = 1'b0;
    #ClockDelay; //command is sent, but the chamber is not pressurized
    pressurized = 1'b1;
    innerDoorState = 1'b1;
    #ClockDelay; //command is sent, but inner door is open
    pressurized = 1'b0; //command is sent, but inner door is open, and the the chamber is not pressurized
    #ClockDelay;
    pressurized = 1'b1;
    innerDoorState = 1'b0;
    #ClockDelay //command is sent, and outer door is opened
    commandSwitch = 1'b0;
    #ClockDelay //close the outer door
    commandSwitch = 1'b1;
    #ClockDelay //open the outer door
    commandSwitch = 1'b0;
    #ClockDelay //close the outer door
    commandSwitch = 1'b0;
    #ClockDelay //close the outer door

    $finish;
  end
endmodule*/
