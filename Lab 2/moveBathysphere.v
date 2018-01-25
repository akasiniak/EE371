//11 is off, 10, is outside, 01 is chamber, 00 is inside
module moveBathysphere (bathysphereState, innerDoorState, outerDoorState, arriving, departing, clk, reset);
  input wire innerDoorState, outerDoorState, arriving, departing, clk, reset;
  output reg [1:0] bathysphereState;
  always @ (posedge clk) begin
    if(arriving ^ departing) begin
        case(bathysphereState)
          2'b11: begin
            if(arriving) begin
              bathysphereState = 2'b10;
            end else begin
              bathysphereState = 2'b00;
            end
          end
          2'b10: begin
            if(arriving && !outerDoorState) begin
              bathysphereState = 2'b01;
            end
            if(departing) begin
              bathysphereState = 2'b11;
            end
          end
          2'b01: begin
            if(arriving && !innerDoorState) begin
              bathysphereState = 2'b00;
            end
            if(departing && !outerDoorState) begin
              bathysphereState = 2'b10;
            end
          end
          2'b00: begin
            if(departing && !innerDoorState) begin
              bathysphereState = 2'b01;
            end
            if(arriving) begin
              bathysphereState = 2'b11;
            end
          end
          default: begin
            bathysphereState = 2'b11;
          end
        endcase
      end else begin
        bathysphereState = 2'b11;
      end
  end
endmodule

module moveBathysphere_testbench;
  reg innerDoorState, outerDoorState, arriving, departing, clk, reset;
  wire [1:0] bathysphereState;
  moveBathysphere dut (bathysphereState, innerDoorState, outerDoorState, arriving, departing, clk, reset);
  parameter ClockDelay = 2;
  initial begin //setup the clock
    clk <= 0;
    forever begin
      #(ClockDelay/2);
      clk <= ~clk;
    end
  end
  initial begin //begin testing
    $dumpfile("moveBathysphere.vcd");
    $dumpvars(1,dut);
    innerDoorState = 1'b0;
    outerDoorState = 1'b0;
    arriving = 1'b0;
    departing = 1'b0;
    reset = 1'b0; #ClockDelay;
    reset = 1'b1; #ClockDelay;
    #ClockDelay;
    arriving = 1'b1;
    #ClockDelay;
    departing = 1'b1;
    #ClockDelay;
    arriving = 1'b0;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    innerDoorState = 1'b1;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    innerDoorState = 1'b0;
    outerDoorState = 1'b1;
    #ClockDelay;
    #ClockDelay;
    arriving = 1'b1;
    #ClockDelay;
    outerDoorState = 1'b0;
    departing = 1'b0;
    innerDoorState = 1'b1;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    innerDoorState = 1'b0;
    outerDoorState = 1'b1;
    #ClockDelay;
    #ClockDelay;
    #ClockDelay;
    $finish;
  end
endmodule
