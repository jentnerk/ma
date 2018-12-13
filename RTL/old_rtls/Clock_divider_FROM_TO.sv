

//start with counter = 1
module Clock_divider_FROM_TO #(parameter int unsigned NEXT, parameter int unsigned COUNTER) (
    input  [COUNTER-1:0]  		clk);
	
	logic clk_div_SN,clk_div_SN;

  always @ (posedge clk[COUNTER-1] or posedge reset) begin
    if (reset) begin
      clk_div_SP <= 1'b0;
    end else begin
      clk_div_SP <= (! clk_div_SN);
    end
  end

  generate
    COUNTER++
      //try for loop 
      if (COUNTER == NEXT)
        begin

        end

      else
        Clock_divider_FROM_TO Clock_divider_FROM_TO #(NEXT, COUNTER)(.clk({clk,clk_div_SN}), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut));
  endgenerate


endmodule