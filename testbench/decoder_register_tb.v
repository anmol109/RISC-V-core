module decoder_register_tb;

reg [31:0] instr;
reg clk,rst;

reg rf_write_en, rf_read_en;
reg [31:0] rf_write_data;
reg [4:0] rf_read_reg,rf_write_reg;
reg [4:0] rf_rs1_addr, rf_rs2_addr;

reg ld;

wire [31:0] rs1_read_data,rs2_read_data;
wire [31:0] read_data;

//top_trial dut1(instr,clk,rst,read_data);
top_trial dut1(instr,clk,rst,rs1_read_data,rs2_read_data, rf_write_en, rf_write_reg, rf_write_data,ld);
//regfile dut2(clk, rst, rf_rs1_addr, rf_rs2_addr, rf_rs1_data, rf_rs2_data, rf_write_en, rf_write_data, rf_write_reg);
//regfile rf(clk, rst, rf_write_en, rf_read_en, rf_read_data, rf_write_data, rf_read_reg, rf_write_reg);

always #3 clk = ~clk;

initial begin
clk = 0; rst = 0;
rf_write_en = 1; 
#10 rf_write_reg = 5'b00000; rf_write_data = 31'd10;
#10 rf_write_reg = 5'b00001; rf_write_data = 31'd15; 
#10 rf_write_en = 0;              //regfile has values


//is_addi
//#10 instr = 32'b000000000011_00000_000_00000_0010011;
#10 ld = 1;
//is_add
#10 instr = 32'b0000000_00000_00001_000_00000_0110011; 
#50 ld = 0;

//is_xor
//#10 instr = 32'b0000000_00000_00001_100_00000_0110011;



#50 $finish;

end
endmodule
