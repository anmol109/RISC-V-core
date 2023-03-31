module rs2_register(clk,rst,  write_data_regfile, read_data);

input clk,rst;

input [31:0] write_data;
output reg [31:0] read_data;

reg mem[31:0];

always @(posedge clk) begin
  
mem <= write_data_regfile;

end

assign read_data = mem;

endmodule