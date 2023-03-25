module regfile(clk, write_en, read_en, read_data, write_data, read_reg, write_reg,rst) ;
input rst;
input clk;
input write_en;
input read_en;
reg [31:0] regs[31:0];
output reg [31:0] read_data;
input [31:0] write_data;
input [4:0] read_reg, write_reg;
reg [4:0] i;

always@(posedge clk,rst)
begin
if(rst)
begin 
for (i=0; i<32 ; i=i+1)
begin
regs[i] <= 32'b0;
end
read_data <= 32'b0;
end
else
begin
if(write_en)
begin
regs[write_reg] <= write_data;
end
else if(read_en)
begin
read_data <= regs[read_reg];
end
end
end
endmodule

