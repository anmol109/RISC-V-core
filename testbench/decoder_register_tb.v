module decoder_register_tb;

reg [31:0] instr,regfile;
reg clk,rst;

reg rf_write_en, rf_read_en;
reg [31:0] rf_write_data;
reg [4:0] rf_read_reg,rf_write_reg;

wire [31:0] read_data;

top_trial dut(instr,clk,rst,regfile,read_data);
regfile rf(clk, rst, rf_write_en, rf_read_en, rf_read_data, rf_write_data, rf_read_reg, rf_write_reg);

always #5 clk = ~clk;

initial begin
regfile = 0;
clk = 0;

//is_addi
//#30 instr = 32'b000011100011_00000_000_00000_0000011;

//is_add
#10 instr = 32'b0000000_00000_00001_000_00000_0110011;
#50 $finish;

end
endmodule
