module riscv_alu_tb;
reg clk,rst,
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
is_ecall;
    reg  [ 31:0]  alu_a;
    reg  [ 31:0]  alu_b;

    // Outputs
    wire [ 31:0]  alu_p_o;

riscv_alu dut
(
    // Inputs
clk,rst,
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
      alu_a
    , alu_b

    // Outputs
    , alu_p_o);

initial begin
clk=1'b0;
alu_a=32'd10;
alu_b=32'd15;
@(negedge clk)
is_add=1'b1;
@(negedge clk)
is_add=1'bx;
@(negedge clk)
is_and=1'b1;
@(negedge clk)
is_and=1'bx;
#50
$finish;
end
initial 
forever #20 clk=~clk;



endmodule