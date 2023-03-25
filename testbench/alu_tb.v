module alu_tb;
 // Inputs
     reg  [  3:0]  alu_op_i;
     reg  [ 31:0]  alu_a_i;
     reg  [ 31:0]  alu_b_i;

    // Outputs
     wire [ 31:0]  alu_p_o;
riscv_alu dut( alu_op_i, alu_a_i, alu_b_i, alu_p_o );
initial begin
alu_a_i = 32'd24;
alu_b_i = 32'd10;
#10
alu_op_i = 4'b0100;
#20
alu_op_i = 4'b0110;
#20
alu_op_i = 4'b0111;
#20
alu_op_i = 4'b1000;
#20
alu_op_i = 4'b1001;
#20
alu_op_i = 4'b1010;
#20
alu_op_i = 4'b1011;
#20
$finish;
end
endmodule