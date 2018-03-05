module loadHolder(out, in, count, clk, reset);
	input wire in, clk, reset;
	input wire [3:0] count;
	output reg out; 
	reg nsOut, countReached, countReachedns;
	always@(posedge clk) begin
		if(reset) begin
			out <= 1'b0;
		end else begin
			out <= nsOut;
			countReached <= countReachedns;
		end
	end
	always@(*) begin
		case(out)
			1'b0: begin
				if(in) begin
					nsOut <= 1'b1; countReachedns <= 1'b0;
				end else nsOut  <= 1'b0; countReachedns <= 1'b0;
			end
			1'b1: begin
				if(count == 4'b1001) begin
					countReachedns <= 1'b1;
					nsOut <= 1'b1;
				end else if(countReached) begin
					nsOut <= 1'b0;
					countReachedns <= 1'b1;
				end else begin
					nsOut <= 1'b1;
					countReachedns <= 1'b0;
				end
			end
			default: begin countReachedns <= 1'b0; nsOut <= 1'b0; end
		endcase
	end
endmodule
