module innerDoor(doorState, commandSwitch, outerDoorState, pressurized, reset, clk);
  input wire commandSwitch, outerDoorState, reset, pressurized, clk;
  output reg doorState;
  always @(posedge clk) begin
    if(!reset) begin
      doorState <= 1'b0; //close the door on reset
    end else begin
      if(commandSwitch) begin //trying to open the inner door
        if(!pressurized && !outerDoorState) begin //can only do it if chamber is not pressurized and outer door is closed
          doorState <= 1'b1;
        end
      end else begin
        doorState <= 1'b0; //close the door
      end
    end
  end
endmodule

/*module innerDoor_testbench;
  reg clk, reset, commandSwitch, outerDoorState, pressurized;
  wire doorState;
  innerDoor dut (doorState, commandSwitch, outerDoorState, pressurized, reset, clk);
  parameter ClockDelay = 2;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay/2);
      clk <= ~clk;
    end
  end
  initial begin //begin testing
    $dumpfile("innerDoor.vcd");
    $dumpvars(1,dut);
    reset = 1'b0; #ClockDelay;
    reset = 1'b1; #ClockDelay;
    commandSwitch = 1'b1;
    pressurized = 1'b1;
    outerDoorState = 1'b0;
    #ClockDelay; //command is sent, but the chamber is pressurized
    pressurized = 1'b0;
    outerDoorState = 1'b1;
    #ClockDelay //command is sent, but outer door is open
    commandSwitch = 1'b0;
    pressurized = 1'b0;
    outerDoorState = 1'b0;
    #ClockDelay //conditions are met, but the command is never sent
    commandSwitch = 1'b1;
    #ClockDelay //conditions are met, and the command is sent
    commandSwitch = 1'b0;
    #ClockDelay //command is back to off


    $finish;
  end
endmodule*/
