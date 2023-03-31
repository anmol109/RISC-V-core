module decoder_register_tb;

reg [31:0] instr,regfile;
reg clk,rst;

wire [31:0] read_data;

top_trial dut(instr,clk,rst,regfile,read_data);

always #5 clk = ~clk;

initial begin
regfile = 0;
clk = 0;

//is_addi
#30 instr = 32'b000011100011_00000_000_00000_0000011;

#50 $finish;

end
endmodule