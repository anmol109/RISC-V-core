//module regfile(clk, rst, rf_write_en, rf_read_en, rf_read_data, rf_write_data, rf_read_reg, rf_write_reg) ;
module regfile(clk, rst, rf_rs1_addr, rf_rs2_addr, rf_rs1_data, rf_rs2_data, rf_write_en, rf_write_data, rf_write_reg);
input rst;
input clk, rf_write_en;
input [4:0] rf_rs1_addr, rf_rs2_addr, rf_write_reg;
output reg[31:0] rf_rs1_data, rf_rs2_data;
reg [4:0] i;
input[31:0] rf_write_data;
reg [31:0] regs[31:0];
always@(posedge clk,rst)
begin
if(rst)
begin 
for (i=0; i<32 ; i=i+1)
begin
regs[i] <= 32'b0;
end
rf_rs1_data <= 32'b0;
rf_rs2_data <= 32'b0;
end
else
begin
if(rf_write_en)
begin
regs[rf_write_reg] <= rf_write_data;
end
else 
begin
rf_rs1_data <= regs[rf_rs1_addr];
rf_rs2_data <= regs[rf_rs2_addr];
end
end
end
endmodule


