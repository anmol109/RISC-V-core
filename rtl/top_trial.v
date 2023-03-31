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
wire[31:0] rf_read_data, rf_write_data;
wire[4:0] read_reg, write_reg;

regfile rf(.clk(clk), .rst(rst), rf_write_en, rf_read_en, rf_read_data, rf_write_data, .rf_read_reg(rs1_reg), rf_write_reg) ;
rs1_register rs1(.clk(clk),.rst(rst), opcode, .write_data_decoder(rs1_imm), .write_data_regfile(rf_read_data), rs1_read_data);
rs2_register rs2(.clk(clk),.rst(rst),.rs2_write_data(, rs2_read_data);


endmodule
