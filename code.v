module D_ff_with_reset_and_enable(
input D,rst,enable,clk,
output reg Q);
always@(posedge clk)
begin 
if(rst)
Q <= 1'b0;
else if(enable)
Q <= D;
else 
Q <= 1'b0;
end
endmodule

module assign_qn_6(
input X,rst,clk,enable,
output Y);
wire X1,X2,Y1,Y2,Y3,P1,P2,P3;
D_ff_with_reset_and_enable A1(.D(X), .rst(rst), .clk(clk), .enable(enable), .Q(X1));
D_ff_with_reset_and_enable A2(.D(X1), .rst(rst), .clk(clk), .enable(enable), .Q(X2));
assign P1 = X - X1 + X2;
D_ff_with_reset_and_enable A3(.D(Y), .rst(rst), .clk(clk), .enable(enable), .Q(Y1));
D_ff_with_reset_and_enable A4(.D(Y1), .rst(rst), .clk(clk), .enable(enable), .Q(Y2));
D_ff_with_reset_and_enable A5(.D(Y2), .rst(rst), .clk(clk),.enable(enable), .Q(Y3));
assign P2 = (Y1 >> 1)  + (Y2 >> 2) + Y3 ;
assign Y = P1 + P2; 
endmodule
