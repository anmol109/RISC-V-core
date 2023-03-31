module top_trial(instr,clk,rst,regfile,read_data);

input [31:0] instr;
input [31:0] regfile;
input clk,rst;

output [31:0] read_data;
wire [31:0] rs1_imm;

decoder_rv d1(instr, clk,
is_beq,is_bne,is_blt,is_bge,is_bltu,is_bgeu,
is_add,
is_addi,
is_slti,
is_or,
is_ori,
is_xor,
is_xori,
is_and,
is_andi,
is_sub,
is_sltiu,
is_slli,
is_srli,
is_srai,
is_sll,
is_slt,
is_sltu,
is_srl,
is_sra,
is_lui,
is_auipc,
is_jal,
is_jalr,
is_jump,
is_lb,
is_lh,
is_lw,
is_lbu,
is_lhu,
is_sb,
is_sh,
is_sw,
is_ecall,
funct7_funct3,
rs1_reg, rs2_reg, rs1_imm
);

//wire [31:0] w1;
//assign w1 = rs1_imm;
wire[31:0] read_data, write_data;
wire[4:0] read_reg, write_reg;

rs1_register r1 (.clk(clk),.rst(rst), .opcode(instr[6:0]), .write_data_decoder(rs1_imm), .write_data_regfile(regfile), .read_data(read_data));
regfile rf_r(.clk(clk), .rst(rst), write_en, read_en, read_data, write_data, read_reg, write_reg) ;
rs2_register r2(.clk(clk),.rst(rst),  .write_data_regfile(read_data), read_data.(rs2_reg));


endmodule
