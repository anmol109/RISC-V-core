module decoder(instr, clk,
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

input [31:0] instr;
input clk;


reg funct7_valid;
reg funct3_valid;

reg is_i_instr;
reg is_r_instr;
reg is_s_instr;
reg is_b_instr;
reg is_j_instr;
reg is_u_instr;

reg rs2_valid;
reg rs1_valid;
reg rd_valid;
reg [10:0] dec_bits;
reg [4:0] rs2;
reg [4:0] rs1;
reg [4:0] rd;
reg [6:0] funct7;
reg [2:0] funct3;
reg [6:0] opcode;

//branch inst
output reg is_beq;
output reg is_bne; 
output reg is_blt;
output reg is_bge;
output reg is_bltu;
output reg is_bgeu;

//alu

output reg is_add ;
output reg is_addi;
output reg is_slti;
output reg is_or;
output reg is_ori;
output reg is_xor;
output reg is_xori;
output reg is_and;
output reg is_andi;
output reg is_sub;
output reg is_sltiu;
output reg is_slli;
output reg is_srli;
output reg is_srai;
output reg is_sll;
output reg is_slt;
output reg is_sltu;
output reg is_srl;
output reg is_sra;
output reg is_lui;
output reg is_auipc;


//jump instructions
output reg is_jal;
output reg is_jalr;
output reg is_jump;

//load instruction
output reg is_lb;
output reg is_lh;
output reg is_lw;
output reg is_lbu;
output reg is_lhu;

//store instructions
output reg is_sb;
output reg is_sh;
output reg is_sw;
output reg is_ecall;




always @(posedge clk) begin
is_i_instr = instr[6:3] === 4'b0000||
             instr[6:4] === 3'b001||
             instr[6:2] === 5'b11001;
is_r_instr = instr[6:4] === 3'b011||
             instr[6:2] === 5'b01011||
             instr[6:2] === 5'b10100;
is_s_instr = instr[6:3] === 4'b0100;
is_b_instr = instr[6:2] === 5'b11000;
is_j_instr = instr[6:2] === 5'b11011;
is_u_instr = instr[4:2] === 3'b101;

rs2_valid = is_r_instr || is_s_instr || is_b_instr;
rs1_valid = is_r_instr || is_i_instr || is_s_instr || is_b_instr;
funct7_valid = is_r_instr;
funct3_valid = is_r_instr || is_i_instr || is_s_instr || is_b_instr;
rd_valid = is_r_instr || is_i_instr || is_u_instr || is_j_instr;

if (rs2_valid) rs2[4:0] = instr[24:20];
if (rs1_valid) rs1[4:0] = instr[19:15];
if (funct7_valid) funct7[6:0] = instr[31:25];
if (funct3_valid) funct3[2:0] = instr[14:12];
if (rd_valid) rd[4:0] = instr[11:7];

rs2[4:0] = instr[24:20];
rs1[4:0] = instr[19:15];
funct7[6:0] = instr[31:25];
funct3[2:0] = instr[14:12];
rd[4:0] = instr[11:7];

dec_bits[10:0] = {{funct7[5]}, {funct3[2:0]}, {instr[6:0]}};
$display("%b", dec_bits);
//branch intructions
is_beq = dec_bits[9:0] === 10'b0001100011;
is_bne = dec_bits[9:0] === 10'b0011100011;
is_blt = dec_bits == 11'b01001100011;
is_bge = dec_bits[9:0] === 10'b1011100011;
is_bltu = dec_bits[9:0] === 10'b1101100011;
is_bgeu = dec_bits[9:0] === 10'b1111100011;

//alu instructions
is_add = dec_bits === 11'b00000110011;
is_addi = dec_bits[9:0] === 10'b0000010011;
is_slti = dec_bits[9:0] == 10'b0100010011;
is_or = dec_bits === 11'b0_110_0110011;
is_ori = dec_bits[9:0] === 10'b_110_0010011;
is_xor = dec_bits === 11'b0_100_0110011;
is_xori = dec_bits[9:0] === 10'b100_0010011;
is_and = dec_bits === 11'b0_111_0110011;
is_andi = dec_bits[9:0] === 10'b111_0010011;
is_sub = dec_bits === 11'b1_000_0110011;
is_sltiu = dec_bits[9:0] === 10'b011_0010011;
is_slli = dec_bits === 11'b0_001_0010011;
is_srli = dec_bits === 11'b0_101_0010011;
is_srai = dec_bits === 11'b1_101_0010011;
is_sll = dec_bits === 11'b0_001_0110011;
is_slt = dec_bits === 11'b0_010_0110011;
is_sltu = dec_bits === 11'b0_011_0110011;
is_srl = dec_bits === 11'b0_101_0110011;
is_sra = dec_bits === 11'b1_101_0110011;
is_lui = dec_bits[6:0] === 7'b0110111;                   
is_auipc = dec_bits[6:0] === 7'b0010111;

//jump instructions
is_jal = dec_bits[6:0] === 7'b1101111;
is_jalr = dec_bits[9:0] === 10'b0001100111;
is_jump = is_jal || is_jalr;

//load instruction
is_lb = dec_bits[9:0] === 10'b0000000011;
is_lh = dec_bits[9:0] === 10'b0010000011;
is_lw = dec_bits[9:0] === 10'b0100000011;
is_lbu = dec_bits[9:0] === 10'b1000000011;
is_lhu = dec_bits[9:0] === 10'b1010000011;

//store instructions
is_sb = dec_bits[9:0] === 10'b0000100011;
is_sh = dec_bits[9:0] === 10'b0010100011;
is_sw = dec_bits[9:0] === 10'b0100100011;

is_ecall = dec_bits === 11'b0_000_1110011;
end
endmodule

module decoder_tb;
reg [31:0] instr;
reg clk;
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

initial begin
clk = 0;
//is_blt
instr = 32'b0000000_00000_00000_100_00000_1100011; 
//is_add
#10 instr = 32'b0000000_00000_00000_000_00000_0110011;
//is_slti
#10 instr = 32'b0000000_00000_00000_010_00000_0010011;
//is_sub
#10 instr = 32'b0100000_00000_00000_000_00000_0110011;
//is_xori
#10 instr = 32'b0100000_00000_00000_100_00000_0010011; 
//is_ecall
#10 instr = 32'b0000000_00000_00000_000_00000_1110011;
//is_sra
#10 instr = 32'b1100000_00000_00000_101_00000_0110011;
//is_ori
#10 instr = 32'b1100000_00000_00000_110_00000_0010011; 
#50 $finish;

end

always #5 clk = ~clk;

endmodule
