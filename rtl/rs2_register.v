module rs2_register(clk,rst,rs2_write_data, rs2_read_data);

input clk,rst;

input [31:0] write_data;
output reg [31:0] rs2_read_data;

reg mem[31:0];

always @(posedge clk) begin
  
mem <= rs2_write_data;

end

assign rs2_read_data = mem;

endmodule