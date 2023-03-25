module add_shift (a,b,clk,rst,ld,out,valid);

parameter N = 8;

output [(N*2)-1:0] out;
output valid;

input [N-1:0] a,b;
input rst,clk,ld;

reg [(N*2)-1:0] out_reg;
reg valid_reg;
reg [(N*2)-1:0] a_reg;
reg [(N*2)-1:0] b_reg;
reg [8:0] bits;

assign out = out_reg;
assign valid = valid_reg;

always @(rst) begin 

out_reg = 0;
a_reg = 0;
b_reg = 0;
valid_reg = 0;
end


always @(posedge clk) begin

if(!rst) begin
case(ld)

1'b1:begin
a_reg = a;
b_reg = b;
bits = N;
end

1'b0:begin
if(b_reg[0]==1) out_reg = out_reg+a_reg;
a_reg = a_reg<<1;
b_reg = b_reg>>1;
bits = bits-1;
end

endcase
if(bits == 0) valid_reg=1;
end
end

endmodule
