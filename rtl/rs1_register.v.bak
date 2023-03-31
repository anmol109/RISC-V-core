module rs1_register(clk,rst, opcode, write_data_decoder, write_data_regfile, read_data);

input clk,rst;
input [6:0] opcode;                 //check if is_r, is_i possible

output [31:0] read_data;

input [31:0] write_data_regfile,write_data_decoder;

reg [31:0] mem;

always @(posedge clk) begin

if(opcode[6:3] === 4'b0000||             //i type check
   opcode[6:4] === 3'b001||
   opcode[6:2] === 5'b11001) 
mem <= write_data_decoder;

else if(opcode[6:4] === 3'b011||
        opcode[6:2] === 5'b01011||
        opcode[6:2] === 5'b10100)
mem <= write_data_regfile;

end

assign read_data = mem;

endmodule
