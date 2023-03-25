module rv_top(clk,reset,instr,out);

input clk,reset;
input [31:0] instr;
output [31:0] out;

//branch inst
wire is_beq;
wire is_bne; 
wire is_blt;
wire is_bge;
wire is_bltu;
wire is_bgeu;

//alu

wire is_add ;
wire is_addi;
wire is_slti;
wire is_or;
wire is_ori;
wire is_xor;
wire is_xori;
wire is_and;
wire is_andi;
wire is_sub;
wire is_sltiu;
wire is_slli;
wire is_srli;
wire is_srai;
wire is_sll;
wire is_slt;
wire is_sltu;
wire is_srl;
wire is_sra;
wire is_lui;
wire is_auipc;


//jump instructions
wire is_jal;
wire is_jalr;
wire is_jump;

//load instruction
wire is_lb;
wire is_lh;
wire is_lw;
wire is_lbu;
wire is_lhu;

//store instructions
wire is_sb;
wire is_sh;
wire is_sw;
wire is_ecall;

decoder d1(instr, clk,
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
is_ecall
);

