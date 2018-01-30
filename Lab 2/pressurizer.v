module pressurizer (pressurized, innerDoorState, outerDoorState, pressurizeSignal, depressurizeSignal, reset, clk);
  input wire innerDoorState, outerDoorState, pressurizeSignal, depressurizeSignal, reset, clk;
  output reg pressurized;
  reg[1:0] pressurizeState; //00 means depressurize, 01 means pressurize, 10 means wait
  reg[3:0] count;
  always @ (posedge clk) begin
    case(pressurizeState)
        2'b00: begin
          if(!pressurized) begin
            pressurizeState <= 2'b10;
          end
        end
        2'b01: begin
          if(pressurized) begin
            pressurizeState <= 2'b10;
          end
        end
        2'b10: begin
          if(!pressurizeSignal && !innerDoorState && !outerDoorState && !pressurized) begin
            pressurizeState <= 2'b01;
          end else if(!depressurizeSignal && !innerDoorState && !outerDoorState && pressurized) begin
            pressurizeState <= 2'b00;
          end
        end
        default: begin
          pressurizeState <= 2'b10;
        end
    endcase
  end
  always @ (posedge clk) begin
    if(!reset) begin
      count <= 4'd0;
      pressurized <= 1'b0;
    end else begin
      if(pressurizeState == 2'b01) begin
        if(!outerDoorState && !innerDoorState && !pressurized) begin //can only pressurize if the doors are closed and not already pressurized
          if(count == 4'd6) begin //pressurize the chamber after 7 ticks of the clock
            pressurized <= 1'b1;
            count <= 4'd0;
          end else begin
            count <= count + 1'b1;
          end
        end
      end else if(pressurizeState == 2'b00) begin
        if(!outerDoorState && !innerDoorState && pressurized) begin //can only depressurize if doors are closed and already pressurized
          if(count == 4'd7) begin
            pressurized <= 1'b0;
            count <= 4'd0;
          end else begin
            count <= count + 1'b1;
          end
        end
      end
    end
  end
endmodule

/*module pressurizer_testbench;
  wire pressurized;
  reg clk, reset, pressurizeSignal, depressurizeSignal, innerDoorState, outerDoorState;
  pressurizer dut (pressurized, innerDoorState, outerDoorState, pressurizeSignal, depressurizeSignal, reset, clk);
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
    $dumpfile("pressurizer.vcd");
    $dumpvars(1,dut);
    reset <= 1'b0; #(2*ClockDelay);
    reset <= 1'b1; #ClockDelay;
    innerDoorState <= 1'b0;
    outerDoorState <= 1'b0;
    depressurizeSignal <= 1'b1;
    pressurizeSignal <= 1'b1;
    #ClockDelay;
    pressurizeSignal <= 1'b0; //begin pressurization
    #ClockDelay;
    pressurizeSignal <= 1'b1;
    for(i = 0; i < 10; i = i + 1)begin
        #ClockDelay;
    end
    #ClockDelay;
    depressurizeSignal <= 1'b0;
    #ClockDelay;
    depressurizeSignal <= 1'b1;
    for(i = 0; i < 8; i = i + 1)begin
      #ClockDelay;
    end
    #ClockDelay;
    pressurizeSignal <= 1'b0; //begin pressurization but inner door is open
    innerDoorState <= 1'b1;
    #ClockDelay;
    pressurizeSignal <= 1'b1;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    depressurizeSignal <= 1'b0; //begin depressurization but inner door is open
    #ClockDelay;
    #ClockDelay;
    depressurizeSignal <= 1'b1;
    #ClockDelay;
    #ClockDelay;
    innerDoorState <= 1'b0;
    depressurizeSignal <= 1'b0;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    depressurizeSignal <= 1'b1;
    #ClockDelay;
    #ClockDelay;
    $finish;
  end
endmodule*/
