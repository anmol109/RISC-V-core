module rv_pc(rst, pc, clk, br, inc, br_addr);
input rst, inc, clk, br;
output reg[4:0] pc;
input[4:0] br_addr;


always@(posedge clk) begin
if(rst)
pc<=5'b0;

else if(br) begin
pc<=br_addr;
end

else if(inc)begin
pc<=pc+1'b1;
end

else begin
pc<=pc;

end
end

endmodule






