module rs1_register(clk,rst, opcode, write_en, read_en, write_data_decoder, write_data_regfile, read_data);

input clk,rst;
input read_en, write_en;
input [6:0] opcode;                 //check if is_r, is_i possible

input [31:0] write_data;
output reg [31:0] read_data;

reg mem[31:0];

always @(posedge clk) begin

if(opcode[6:3] === 4'b0000||             //i type check
   opcode[6:4] === 3'b001||
   opcode[6:2] === 5'b11001) 
mem <= write_data_decoder;

else if(opcode[6:3] === 4'b0000||             //r type check
   opcode[6:4] === 3'b001||
   opcode[6:2] === 5'b11001) 
mem <= write_data_regfile;

end

assign read_data = mem;

endmodule
