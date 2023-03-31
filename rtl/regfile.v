module regfile(clk, rst, rf_write_en, rf_read_en, rf_read_data, rf_write_data, rf_read_reg, rf_write_reg) ;
input rst;
input clk;
input rf_write_en;
input rf_read_en;
reg [31:0] regs[31:0];
output reg [31:0] rf_read_data;
input [31:0] rf_write_data;
input [4:0] rf_read_reg, rf_write_reg;
reg [4:0] i;

always@(posedge clk,rst)
begin
if(rst)
begin 
for (i=0; i<32 ; i=i+1)
begin
regs[i] <= 32'b0;
end
rf_read_data <= 32'b0;
end
else
begin
if(rf_write_en)
begin
regs[rf_write_reg] <= rf_write_data;
end
else if(rf_read_en)
begin
rf_read_data <= regs[rf_read_reg];
end
end
end
endmodule


